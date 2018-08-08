# CREDIT: Bart Duchesne
# https://github.com/bduc/raspcan/blob/master/raspcan_test.rb
module RubyCan
  class CanSocket < Socket
  
    PF_CAN=29
    AF_CAN=PF_CAN
    CAN_RAW=1
    SIOCGIFINDEX=0x8933
  
    def initialize( can_interface_name )
  
      super(PF_CAN, Socket::SOCK_RAW, CAN_RAW)
  
      # struct ifreq in net/if.h
      if_idx_req = can_interface_name.ljust(16,"\0")+[0].pack("L")
      ioctl(SIOCGIFINDEX, if_idx_req )
  
      if_name,if_index = if_idx_req.unpack("A16L")
  
      # sockaddr_can from linux/can.h
      #struct sockaddr_can {
      #  __kernel_sa_family_t can_family;                                     S
      #  int         can_ifindex;                                             l
      #  union {
      #    /* transport protocol class address information (e.g. ISOTP) */
      #    struct { canid_t rx_id, tx_id; } tp;                               LL
      #
      #    /* reserved for future CAN protocols address information */
      #  } can_addr;
      #};
      # align on 16 byte -> pad with 2 bytes exta                             S
  
      sockaddr_can = [AF_CAN,if_index,0,0,0].pack("SlLLS")
  
      bind(sockaddr_can)
    end
  end
end
