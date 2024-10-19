local bootTime = os.time()
print("Trianity init")
_G.injected = true
local PlayersService = game:GetService('Players')
local isSubjectToChinaPolicies = true
local policyTable
local initialized = false
local initAsyncCalledOnce = false
local initializedEvent = Instance.new("BindableEvent")
local PolicyService = {}
if initialized then return end
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
initialized = true
initializedEvent:Fire()
print(policyTable)
wait(0.3)
local inithash = math.random(100, 1000)
print(_G.Injected)
if policyTable then
	print("Init:", inithash)
end
print("Init Success")
print("Time Take:", os.time() - bootTime)
