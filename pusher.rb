require 'houston'

APN = Houston::Client.development
APN.certificate = File.read("dev_apns_cert.pem")
APN.passphrase = '1234'

token = "a341b32258bc0c1508982761f0ac5123bee77da28fb3a3af0bc17d56e3da92a1"

notification = Houston::Notification.new(device: token)
notification.alert = "Store open/closed!"
notification.sound = 'money_sound.mp3'
notification.badge = '1'
notification.custom_data = {
	payload: {
		type: 3,
		role: 'store',
		data: {
			store_open: false
		}
	}
}

APN.push(notification)