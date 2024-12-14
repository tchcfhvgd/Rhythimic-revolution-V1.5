function onEvent(name, value1, value2)
    if name == 'Change Note Skin' then
        local noteSkin = value1  -- value1에 입력한 값을 노트 스킨으로 사용

        -- 모든 플레이어 노트에 대해 노트 스킨 변경
        for i = 0, getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'texture', noteSkin)
            end
        end
    end
end