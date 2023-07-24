delcareVariables()
{
    fConfig="$HOME/.config"
    fCopy="$(pwd)"
    locations=("i3" "polybar" "rofi")
}

copying()
{
    # Options are backup or upload
    copySwitch="backup"

    for location in ${locations[@]}
    do
        if [ $copySwitch = "backup" ]
        then
            rm -rf $fCopy/$location
            mkdir -p $fCopy/$location
            cp -RT $fConfig/$location/ $fCopy/$location/
        elif [ $copySwitch = "upload" ]
        then
            rm -rf $fConfig/$location
            mkdir -p $fConfig/$location
            cp -RT $fCopy/$location/ $fConfig/$location/
        fi
    done
}

main()
{
    delcareVariables
    copying
}

main
