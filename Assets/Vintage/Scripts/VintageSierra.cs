﻿///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Vintage - Image Effects.
// Copyright (c) Ibuprogames. All rights reserved.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
using System;

using UnityEngine;

namespace VintageImageEffects
{
  /// <summary>
  /// Vintage Sierra.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Sierra")]
  public sealed class VintageSierra : ImageEffectBase
  {
    /// <summary>
    // Levels. Default 'Resources/sierraVignette'.
    /// </summary>
    public Texture2D blowoutTex;

    /// <summary>
    // Levels. Default 'Resources/overlayMap'.
    /// </summary>
    public Texture2D overlayTex;

    /// <summary>
    // Levels. Default 'Resources/sierraMap'.
    /// </summary>
    public Texture2D levelsTex;

    /// <summary>
    /// Overlay strength (0 none, 1 full).
    /// </summary>
    public float overlayStrength = 0.5f;

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageSierra"; } }

    /// <summary>
    /// Is an 'extra' effect?
    /// </summary>
    public override bool IsExtraEffect { get { return false; } }

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      blowoutTex = VintageHelper.LoadTextureFromResources(@"Textures/sierraVignette");
      overlayTex = VintageHelper.LoadTextureFromResources(@"Textures/overlayMap");
      levelsTex = VintageHelper.LoadTextureFromResources(@"Textures/sierraMap");

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the default values of the shader.
    /// </summary>
    public override void ResetDefaultValues()
    {
      overlayStrength = 0.5f;

      base.ResetDefaultValues();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetTexture(VintageHelper.ShaderBlowoutTex, blowoutTex);
      this.Material.SetTexture(VintageHelper.ShaderOverlayTex, overlayTex);
      this.Material.SetTexture(VintageHelper.ShaderLevelsTex, levelsTex);
      this.Material.SetFloat(VintageHelper.ShaderOverlayStrength, overlayStrength);

      base.SendValuesToShader();
    }
  }
}