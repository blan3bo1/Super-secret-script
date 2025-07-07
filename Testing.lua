local library = loadstring(game:HttpGet("https://github.com/GoHamza/AppleLibrary/blob/main/main.lua?raw=true"))()

-- ======================================
-- CONFIGURATION (Edit these values only)
-- ======================================
local validKeys = {
    "MASTERKEY123",  -- Primary access key
    "SECONDARYKEY",  -- Backup key
    "TESTKEY2023",   -- Testing key
    -- Add more keys as needed (comma separated)
}

-- ======================================
-- KEY VERIFICATION SYSTEM
-- ======================================
local keyWindow = library:init("Key Verification", true, Enum.KeyCode.RightShift, true)
keyWindow:Divider("🔒 Premium Access Required")

local keySection = keyWindow:Section("Authentication")
local userInput = ""

-- Key input field
keySection:TextField("", "Enter your access key...", function(input)
    userInput = input
end)

-- Submit button
keySection:Button("Unlock UI", function()
    -- Check if entered key matches any valid key
    for _, validKey in pairs(validKeys) do
        if userInput == validKey then
            keyWindow:TempNotify("✅ Access Granted", "Loading premium features...", "rbxassetid://12608259004")
            wait(1)
            keyWindow:Destroy()
            createMainUI()
            return
        end
    end
    
    -- If no match found
    keyWindow:TempNotify("❌ Invalid Key", "Please check your key and try again", "rbxassetid://12608259004")
end)

-- ======================================
-- MAIN APPLICATION UI (After verification)
-- ======================================
function createMainUI()
    local window = library:init("Premium UI", true, Enum.KeyCode.RightShift, true)
    
    -- Your original UI components
    window:Divider("Welcome to Premium Access!")
    
    local sectionA = window:Section("Main Features")
    sectionA:Button("Click me!", function()
        print("Button clicked!")
    end)
    
    sectionA:Switch("Toggle Feature", false, function(state)
        print("Feature enabled:", state)
    end)
    
    window:Divider("Utilities")
    local sectionB = window:Section("Tools")
    
    sectionB:Button("Test Notification", function()
        window:TempNotify("Premium Feature", "This is working perfectly!", "rbxassetid://12608259004")
    end)
    
    window:GreenButton(function()
        print("Green button activated!")
    end)
end
