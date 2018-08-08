Given(/^A steady stream of CAN traffic is on "([^"]*)" with ID of "([^"]*)" and data of "([^"]*)" is on the network$/) do |dev, id, data|
  ifup = false
  playing_data = false
  ifup = true if File.exists? "/sys/class/net/#{dev}"
  playing_data = system "cangen #{dev} -I #{id} -L #{data.size / 2} -D #{data} &"
  ifup and playing_data
end

When(/^I create a listening socket on "([^"]*)"$/) do |dev|
  @socket = RubyCan::CanSocket.new( dev )
  not @socket == nil
end

Then(/^I should see a packet with ID of "([^"]*)" with a size of (\d+) and data of "([^"]*)"$/) do |id, dlc, data|
  can_packet = RubyCan::CanPacket.read(@socket.read(16))
  can_packet.can_id == id and can_packet.can_dlc == dlc and can_packet.data.to_s == data
end

Then(/^the stream stops$/) do
  system "killall cangen"
end

