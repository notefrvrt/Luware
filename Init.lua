local signal = false
local function callback(signal)
	local signal = true
end
local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
local bootTime = os.time()
print("Trianity init")
_G.Injected = true
local PlayersService = game:GetService('Players')
local isSubjectToChinaPolicies = true
local policyTable
_G.initialized = false
local initAsyncCalledOnce = false
local initializedEvent = Instance.new("BindableEvent")
local PolicyService = {}
if _G.initialized then return end
	if initAsyncCalledOnce then
	initializedEvent.Event:Wait()
	return
end
initAsyncCalledOnce = true
local localPlayer = PlayersService.LocalPlayer
while not localPlayer do
PlayersService.PlayerAdded:Wait()
localPlayer = PlayersService.LocalPlayer
end
assert(localPlayer, "")
pcall(function() policyTable = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(localPlayer) end)
	if policyTable then
	isSubjectToChinaPolicies = policyTable["IsSubjectToChinaPolicies"]
end
_G.initialized = true
initializedEvent:Fire()
print(policyTable, signal)
wait(0.6)
local inithash = math.random(100, 1000)
print(_G.Injected)
if policyTable then
	print("Init:", inithash)
end
print("Init Success")
print("Time Take:", os.time() - bootTime)
 
game.StarterGui:SetCore("SendNotification", {
    Title = "TrianAPI";
    Text = "Connected to roblox";
    Duration = "5";
    Callback = NotificationBindable;
})
print(signal)
