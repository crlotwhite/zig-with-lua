function getClientInfo()
    return {
        name = "ZigTest",
        author = "crlotwhite",
        versionNumber = 1,
        minEditorVersion = 0
    }
end

function main()
    package.loadlib("./lluuaa.dll", "luaopen_mylib")()
    local result = adder(5, 3)
    SV:showMessageBox("title", result)
    SV:finish()
end
