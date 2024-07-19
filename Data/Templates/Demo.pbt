Assets {
  Id: 3092466986916753716
  Name: "Demo"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 15861904926075985536
      Objects {
        Id: 15861904926075985536
        Name: "Demo"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 14501373942661709814
        ChildIds: 5336438269922370932
        ChildIds: 179054965660906206
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 14501373942661709814
        Name: "Events_Example"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15861904926075985536
        UnregisteredParameters {
          Overrides {
            Name: "cs:Factory"
            AssetReference {
              Id: 8773368531946434009
            }
          }
          Overrides {
            Name: "cs:Factory_Events"
            AssetReference {
              Id: 5865857680388035929
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 11763234371403986862
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 5336438269922370932
        Name: "LocalContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15861904926075985536
        ChildIds: 6942677842041320410
        ChildIds: 14978616016882508918
        ChildIds: 12495623744255058041
        ChildIds: 7016408244398158948
        ChildIds: 10869504605375819130
        ChildIds: 14061462723254223412
        ChildIds: 9981516184770678199
        ChildIds: 11788040730121966721
        ChildIds: 1539058582277800050
        ChildIds: 3278762648618368024
        ChildIds: 3975954098653588767
        ChildIds: 10665148101499052830
        ChildIds: 1872091535876480888
        ChildIds: 11065373103532397320
        ChildIds: 5152341072314137192
        ChildIds: 6536405308864537252
        ChildIds: 8698216161991793811
        ChildIds: 2000398150896186768
        ChildIds: 5992389796042950765
        ChildIds: 9252152076857623557
        ChildIds: 178507210208441797
        ChildIds: 736847000324081216
        ChildIds: 17538521399465220066
        ChildIds: 14403080803766608763
        ChildIds: 1746765608291442471
        ChildIds: 6999228596488593751
        ChildIds: 7255893407014686561
        ChildIds: 150701234933423070
        ChildIds: 3618204702746250547
        ChildIds: 10180059699090861394
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        NetworkContext {
          Type: Local
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 6942677842041320410
        Name: "Fabricator"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 6372867914459017992
            value {
              Overrides {
                Name: "Name"
                String: "Fabricator"
              }
              Overrides {
                Name: "Position"
                Vector {
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "cs:DropSpeed"
                Float: 1
              }
              Overrides {
                Name: "cs:SpawnInterval"
                Float: 1
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1686666998512040549
          }
        }
      }
      Objects {
        Id: 14978616016882508918
        Name: "Furnace"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 8478561538607360027
            value {
              Overrides {
                Name: "Name"
                String: "Furnace"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 350
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
            }
          }
          TemplateAsset {
            Id: 17483864326085706183
          }
        }
      }
      Objects {
        Id: 12495623744255058041
        Name: "Fabricator"
        Transform {
          Location {
            Y: 200
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 6372867914459017992
            value {
              Overrides {
                Name: "Name"
                String: "Fabricator"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2000
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -179.999954
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
              Overrides {
                Name: "cs:Item"
                AssetReference {
                  Id: 14567499687933304266
                }
              }
            }
          }
          TemplateAsset {
            Id: 1686666998512040549
          }
        }
      }
      Objects {
        Id: 7016408244398158948
        Name: "Collector"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 6788003901803533037
            value {
              Overrides {
                Name: "Name"
                String: "Collector"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2750.00024
                  Y: 150
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999847
                }
              }
            }
          }
          TemplateAsset {
            Id: 2518231178622858489
          }
        }
      }
      Objects {
        Id: 10869504605375819130
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 750
                  Y: -250
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
              Overrides {
                Name: "cs:BeltSpeed"
                Float: 2
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 14061462723254223412
        Name: "Crafter"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 13394541485659120988
            value {
              Overrides {
                Name: "Name"
                String: "Crafter"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1200
                  Y: 600
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999847
                }
              }
            }
          }
          TemplateAsset {
            Id: 7846856286592034686
          }
        }
      }
      Objects {
        Id: 9981516184770678199
        Name: "Splitter"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 420840578759174117
            value {
              Overrides {
                Name: "Name"
                String: "Splitter"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 750
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
            }
          }
          TemplateAsset {
            Id: 6724390745700219946
          }
        }
      }
      Objects {
        Id: 11788040730121966721
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 750
            Y: -50
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 750
                  Y: 250
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 1539058582277800050
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 1550
            Y: 200
          }
          Rotation {
            Yaw: -89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 4450295463188693800
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:inheritfromparent"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1650
                  Y: -250
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -179.999969
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 3278762648618368024
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 1550
            Y: 200
          }
          Rotation {
            Yaw: -89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 4450295463188693800
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1200
                  Y: -200
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -89.9999847
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 13626050109989023739
            value {
              Overrides {
                Name: "Position"
                Vector {
                  X: 46.1111412
                  Z: 50
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 3975954098653588767
        Name: "Splitter"
        Transform {
          Location {
            X: 750
            Y: 200
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 420840578759174117
            value {
              Overrides {
                Name: "Name"
                String: "Splitter"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1650
                  Y: -6.10351562e-05
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -179.999969
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 6724390745700219946
          }
        }
      }
      Objects {
        Id: 10665148101499052830
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 1200
          }
          Rotation {
            Yaw: -89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 4450295463188693800
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1200
                  Y: 200
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999847
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 1872091535876480888
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 750
            Y: -50
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1650
                  Y: 250
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -179.999969
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 11065373103532397320
        Name: "Conveyor Belt - Up"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 11935189676529130616
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Up"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1200
                  Y: 1000
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999847
                }
              }
            }
          }
          TemplateAsset {
            Id: 2216478327471546712
          }
        }
      }
      Objects {
        Id: 5152341072314137192
        Name: "Conveyor Belt - Up - Xtra Tall"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 7012349173275907319
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Up - Xtra Tall"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1200
                  Y: 1350
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999847
                }
              }
            }
          }
          TemplateAsset {
            Id: 8092454622579383210
          }
        }
      }
      Objects {
        Id: 6536405308864537252
        Name: "Conveyor Belt - Straight - XtraTall"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 2144476018224054376
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - XtraTall"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1150
                  Y: 1750
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 9019670848863952030
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          TemplateAsset {
            Id: 5803895955586069300
          }
        }
      }
      Objects {
        Id: 8698216161991793811
        Name: "Conveyor Belt - Straight - XtraTall"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 2144476018224054376
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - XtraTall"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1550
                  Y: 1750
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
            }
          }
          TemplateAsset {
            Id: 5803895955586069300
          }
        }
      }
      Objects {
        Id: 2000398150896186768
        Name: "Hopper - Tall"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        TemplateInstance {
          ParameterOverrideMap {
            key: 790890781271947769
            value {
              Overrides {
                Name: "Name"
                String: "Hopper - Tall"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1950
                  Y: 1750
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
            }
          }
          TemplateAsset {
            Id: 4776630809341637856
          }
        }
      }
      Objects {
        Id: 5992389796042950765
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 4450295463188693800
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2400
                  Y: 1800
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -89.9999847
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 9252152076857623557
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 2400
            Y: 2000
          }
          Rotation {
            Yaw: -89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2400
                  Y: 1400
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -89.9999847
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 178507210208441797
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 2400
            Y: 1600
          }
          Rotation {
            Yaw: -89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2400
                  Y: 1000
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -89.9999847
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 736847000324081216
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 2400
            Y: 1200
          }
          Rotation {
            Yaw: -89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2400
                  Y: 600
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -89.9999847
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 17538521399465220066
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1150
                  Y: -1050
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 17057591509000847660
            value {
              Overrides {
                Name: "Position"
                Vector {
                  X: -38.3044167
                  Y: -8.29950222e-05
                  Z: 50
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 14403080803766608763
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 1150
            Y: -850
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1550
                  Y: -1050
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 1746765608291442471
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 1550
            Y: -850
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1950
                  Y: -1050
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 6999228596488593751
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 1950
            Y: -850
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2400
                  Y: -1100
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999847
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 17057591509000847660
            value {
              Overrides {
                Name: "Position"
                Vector {
                  X: -38.3044167
                  Y: -8.29950222e-05
                  Z: 50
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 7255893407014686561
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 2400
            Y: -900
          }
          Rotation {
            Yaw: 89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2400
                  Y: -700
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999619
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 150701234933423070
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 2400
            Y: -500
          }
          Rotation {
            Yaw: 89.9999771
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2400
                  Y: -300
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 89.9999542
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 3618204702746250547
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 2400
            Y: -100
          }
          Rotation {
            Yaw: 89.9999542
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 4450295463188693800
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 2350
                  Y: 150
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 13626050109989023739
            value {
              Overrides {
                Name: "Position"
                Vector {
                  X: 38.2476234
                  Y: 1.65990041e-05
                  Z: 50
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 10180059699090861394
        Name: "Conveyor Belt - Straight - Medium"
        Transform {
          Location {
            X: 1200
            Y: -200
          }
          Rotation {
            Yaw: -89.9999924
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5336438269922370932
        TemplateInstance {
          ParameterOverrideMap {
            key: 4450295463188693800
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 5723004317991407067
            value {
              Overrides {
                Name: "Visible"
                Enum {
                  Value: "mc:evisibilitysetting:forceoff"
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 6713841680862715870
            value {
              Overrides {
                Name: "Name"
                String: "Conveyor Belt - Straight - Medium"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1200
                  Y: -600
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -89.9999924
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          ParameterOverrideMap {
            key: 13626050109989023739
            value {
              Overrides {
                Name: "Position"
                Vector {
                  X: 46.1111412
                  Z: 50
                }
              }
            }
          }
          TemplateAsset {
            Id: 1086243960227633116
          }
        }
      }
      Objects {
        Id: 179054965660906206
        Name: "Previews"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15861904926075985536
        ChildIds: 6695992793812807262
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        NetworkContext {
          Type: Local
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 6695992793812807262
        Name: "Crafter Preview"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 179054965660906206
        TemplateInstance {
          ParameterOverrideMap {
            key: 13221195285100114106
            value {
              Overrides {
                Name: "Name"
                String: "Crafter Preview"
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 1200
                  Y: -700
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: -90
                }
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
            }
          }
          TemplateAsset {
            Id: 10057912986636322253
          }
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 125
}
