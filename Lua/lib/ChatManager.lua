local init = ChatGui.init
function ChatGui:init(ws)
	init(self, ws)
	TeamSpeak.Hooks:Call("ChatManagerOnLoad")
end

local send_message = ChatManager.send_message
function ChatManager:send_message(channel, sender, message)
	local args = TeamSpeak.Hooks:Call("ChatManagerOnSendMessage", channel, sender, message)
	if args ~= nil then return send_message(self, unpack(args)) end
end

local _receive_message = ChatManager._receive_message;
function ChatManager:_receive_message(channel, name, message, color, icon)
	local args = TeamSpeak.Hooks:Call("ChatManagerOnReceiveMessage", channel, name, message, color, icon)
	if args ~= nil then return _receive_message(self, unpack(args)) end
end