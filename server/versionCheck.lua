local resourceName = '^3[FearlessStudios-???] '

function printVersion(cur, late, status) 
    print('^7----------------------------------------------------------')
    print(resourceName .. '^4Checking for update...')
    print(resourceName .. '^4' .. cur)
    print(resourceName .. '^4' .. late)
    print(resourceName .. status)
    print('^7----------------------------------------------------------')
end

function checkVersion()
    local cur = ''
    local late = ''
    local status = ''
       
    local current = GetResourceMetadata(GetCurrentResourceName(), "version", 0);
    cur = "Current version: " .. current

    PerformHttpRequest('https://raw.githubusercontent.com/FearlessNite345/FearlessStudios-VersionChecker/main/???-version.txt', function(Error, Version, Header)   
        if Error ~= 200 then 
            printVersion(cur, 'Latest version: ^8Failed to fetch', '^8' .. Error)
            return
        end
        
        late = "Latest version: " .. Version

        if Version ~= current then
            status = "^8Your MusicHub version is outdated, Go to the keymaster download page to update to the latest."
        else
            status = "^2MusicHub is up to date!"
        end

        printVersion(cur, late, status)
    end)
end

checkVersion()