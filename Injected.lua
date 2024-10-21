_G.initialized = true
_G.Injected = true
game.StarterGui:SetCore("SendNotification", {
    Title = "TrianAPI";
    Text = "Attached to game";
    Duration = "5";
    Callback = NotificationBindable;
})
