wOS.DynaBase:RegisterSource({
    Name = "Darth Vader Stance",
    Type =  WOS_DYNABASE.EXTENSION,
    Shared = "models/player/wiltos/vader_stance.mdl",
})

hook.Add( "PreLoadAnimations", "wOS.DynaBase.MountVader", function( gender )
    if gender != WOS_DYNABASE.SHARED then return end
    IncludeModel( "models/player/wiltos/vader_stance.mdl" )
end )
