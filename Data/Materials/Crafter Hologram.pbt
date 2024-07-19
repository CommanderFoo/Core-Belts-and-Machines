Assets {
  Id: 4977550328203723437
  Name: "Crafter Hologram"
  PlatformAssetType: 13
  SerializationVersion: 125
  VirtualFolderPath: "Machines"
  CustomMaterialAsset {
    BaseMaterialId: 2911767971652048308
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 0.186000049
          G: 0.638223231
          B: 1
          A: 1
        }
      }
      Overrides {
        Name: "distortion amount"
        Float: 0
      }
      Overrides {
        Name: "distortion noise scale"
        Float: 0
      }
      Overrides {
        Name: "distortion speed"
        Float: 0
      }
      Overrides {
        Name: "glitch speed"
        Float: 0
      }
      Overrides {
        Name: "fresnel power"
        Float: 1.19056773
      }
      Overrides {
        Name: "scanlines"
        Float: 1
      }
      Overrides {
        Name: "flicker speed"
        Float: 0.163983271
      }
    }
    Assets {
      Id: 2911767971652048308
      Name: "Glitchy Hologram"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxmi_hologram"
      }
    }
  }
}
