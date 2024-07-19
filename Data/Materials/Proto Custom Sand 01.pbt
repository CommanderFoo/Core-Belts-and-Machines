Assets {
  Id: 13466134738069141727
  Name: "Proto Custom Sand 01"
  PlatformAssetType: 13
  SerializationVersion: 125
  VirtualFolderPath: "Prototyping"
  CustomMaterialAsset {
    BaseMaterialId: 9444137729551429009
    ParameterOverrides {
      Overrides {
        Name: "roughness_multiplier"
        Float: 1
      }
      Overrides {
        Name: "brightness_albedo"
        Float: 1
      }
      Overrides {
        Name: "desaturation_albedo"
        Float: 0
      }
      Overrides {
        Name: "b_invert_metallic"
        Bool: false
      }
      Overrides {
        Name: "fresnel_color"
        Color {
          R: 0.906
          G: 0.906
          B: 0.906
          A: 1
        }
      }
    }
    Assets {
      Id: 9444137729551429009
      Name: "Sand 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_sand_001_uv"
      }
    }
  }
}
