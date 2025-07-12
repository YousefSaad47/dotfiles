function la
    exa -a --icons --group-directories-first --color=always $argv
end

function ll
    exa -la --icons --group-directories-first --color=always $argv
end

function ls
    exa --icons --group-directories-first --color=always $argv
end

function vim
    nvim $argv
end
