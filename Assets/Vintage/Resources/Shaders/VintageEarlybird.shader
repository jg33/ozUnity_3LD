﻿///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Vintage - Image Effects.
//
// Copyright (c) Ibuprogames <hello@ibuprogames.com>. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// http://unity3d.com/support/documentation/Components/SL-Shader.html
Shader "Hidden/Vintage/Earlybird"
{
  // http://unity3d.com/support/documentation/Components/SL-Properties.html
  Properties
  {
    _MainTex("Base (RGB)", 2D) = "white" {}

    // Amount of the effect (0 none, 1 full).
    _Amount("Amount", Range(0.0, 1.0)) = 1.0
  }

  CGINCLUDE
  #include "UnityCG.cginc"
  #include "Vintage.cginc"

  sampler2D _MainTex;
  sampler2D _CurvesTex;
  sampler2D _OverlayTex;
  sampler2D _BlowoutTex;
  sampler2D _LevelsTex;

  float _Obturation = 1.0f;
  float _Amount = 1.0f;

  float4 frag_gamma(v2f_img i) : COLOR
  {
    float3 pixel = tex2D(_MainTex, i.uv).rgb;
    float3 final = pixel;

#ifdef EFFECT_ENABLED

    // Curves.
    float2 lookup;
    lookup.y = 0.5f;
    lookup.x = pixel.r;
    final.r = tex2D(_CurvesTex, lookup).r;
    lookup.x = pixel.g;
    final.g = tex2D(_CurvesTex, lookup).g;
    lookup.x = pixel.b;
    final.b = tex2D(_CurvesTex, lookup).b;

    // Desaturation.
    float desaturatedColor = Desaturate(final);

	  // Overlay.
    float3 result;
    lookup.x = desaturatedColor;
    result.r = tex2D(_OverlayTex, lookup).r;
    lookup.x = desaturatedColor;
    result.g = tex2D(_OverlayTex, lookup).g;
    lookup.x = desaturatedColor;
    result.b = tex2D(_OverlayTex, lookup).b;

    final = lerp(final, result, 0.5f);

    float value = 0.0;
#ifdef OBTURATION
    float2 tc = (_Obturation * i.uv) - (_Obturation * 0.5f);
    float vignette = 1.0f - dot(tc, tc);
    final *= vignette * vignette * vignette;

    float d = dot(tc, tc) * 0.5f;
    value = smoothstep(0.0f, 1.25f, pow(d, 1.35f) / 1.65f);
#endif

    // Blowout.
    float3 sampled;
    lookup.x = final.r;
    sampled.r = tex2D(_BlowoutTex, lookup).r;
    lookup.x = final.g;
    sampled.g = tex2D(_BlowoutTex, lookup).g;
    lookup.x = final.b;
    sampled.b = tex2D(_BlowoutTex, lookup).b;

    final = lerp(sampled, final, value);

    // Levels.
    lookup.x = final.r;
    final.r = tex2D(_LevelsTex, lookup).r;
    lookup.x = final.g;
    final.g = tex2D(_LevelsTex, lookup).g;
    lookup.x = final.b;
    final.b = tex2D(_LevelsTex, lookup).b;

#ifdef FILM_ENABLED
    final = PixelFilm(final, i.uv, _FilmGrainStrength, _FilmBlinkStrenght);
#endif

#ifdef COLORCONTROL_ENABLED
    final = PixelBrightnessContrastGamma(final, _Brightness, _Contrast, _Gamma);

    final = PixelHueSaturation(final, _Hue, _Saturation);
#endif

    final = PixelAmount(pixel, final, _Amount);

#ifdef ENABLE_ALL_DEMO
    final = PixelDemo(pixel, final, i.uv);
#endif

#endif

    return float4(final, 1.0f);
  }

  float4 frag_linear(v2f_img i) : COLOR
  {
    float3 pixel = sRGB(tex2D(_MainTex, i.uv).rgb);
    float3 final = pixel;

#ifdef EFFECT_ENABLED

    // Curves.
    float2 lookup;
    lookup.y = 0.5f;
    lookup.x = pixel.r;
    final.r = sRGB(tex2D(_CurvesTex, lookup).rgb).r;
    lookup.x = pixel.g;
    final.g = sRGB(tex2D(_CurvesTex, lookup).rgb).g;
    lookup.x = pixel.b;
    final.b = sRGB(tex2D(_CurvesTex, lookup).rgb).b;

    // Desaturation.
    float desaturatedColor = Desaturate(final);

	  // Overlay.
    float3 result;
    lookup.x = desaturatedColor;
    result.r = sRGB(tex2D(_OverlayTex, lookup).rgb).r;
    lookup.x = desaturatedColor;
    result.g = sRGB(tex2D(_OverlayTex, lookup).rgb).g;
    lookup.x = desaturatedColor;
    result.b = sRGB(tex2D(_OverlayTex, lookup).rgb).b;

    final = lerp(final, result, 0.5f);

    float value = 0.0;
#ifdef OBTURATION
    float2 tc = (_Obturation * i.uv) - (_Obturation * 0.5f);
    float vignette = 1.0f - dot(tc, tc);
    final *= vignette * vignette * vignette;

    float d = dot(tc, tc) * 0.5f;
    value = smoothstep(0.0f, 1.25f, pow(d, 1.35f) / 1.65f);
#endif

	  // Blowout.
    float3 sampled;
    lookup.x = final.r;
    sampled.r = sRGB(tex2D(_BlowoutTex, lookup).rgb).r;
    lookup.x = final.g;
    sampled.g = sRGB(tex2D(_BlowoutTex, lookup).rgb).g;
    lookup.x = final.b;
    sampled.b = sRGB(tex2D(_BlowoutTex, lookup).rgb).b;
    
    final = lerp(sampled, final, value);

    // Levels.
    lookup.x = final.r;
    final.r = sRGB(tex2D(_LevelsTex, lookup).rgb).r;
    lookup.x = final.g;
    final.g = sRGB(tex2D(_LevelsTex, lookup).rgb).g;
    lookup.x = final.b;
    final.b = sRGB(tex2D(_LevelsTex, lookup).rgb).b;

#ifdef FILM_ENABLED
    final = PixelFilm(final, i.uv, _FilmGrainStrength, _FilmBlinkStrenght);
#endif

#ifdef COLORCONTROL_ENABLED
    final = PixelBrightnessContrastGamma(final, _Brightness, _Contrast, _Gamma);

    final = PixelHueSaturation(final, _Hue, _Saturation);
#endif

    final = PixelAmount(pixel, final, _Amount);

#ifdef ENABLE_ALL_DEMO
    final = PixelDemo(pixel, final, i.uv);
#endif

#endif

    return float4(Linear(final), 1.0f);
  }
  ENDCG

  // Techniques (http://unity3d.com/support/documentation/Components/SL-SubShader.html).
  SubShader
  {
    // Tags (http://docs.unity3d.com/Manual/SL-CullAndDepth.html).
    ZTest Always
    Cull Off
    ZWrite Off
    Fog { Mode off }

    // Pass 0: Color Space Gamma.
    Pass
    {
      CGPROGRAM
      #pragma fragmentoption ARB_precision_hint_fastest
      #pragma multi_compile ___ EFFECT_ENABLED
      #pragma multi_compile ___ COLORCONTROL_ENABLED
      #pragma multi_compile ___ FILM_ENABLED
      #pragma multi_compile ___ OBTURATION
      #pragma target 3.0
      #pragma vertex vert_img
      #pragma fragment frag_gamma
      ENDCG
    }

    // Pass 1: Color Space Linear.
    Pass
    {
      CGPROGRAM
      #pragma fragmentoption ARB_precision_hint_fastest
      #pragma multi_compile ___ EFFECT_ENABLED
      #pragma multi_compile ___ COLORCONTROL_ENABLED
      #pragma multi_compile ___ FILM_ENABLED
      #pragma multi_compile ___ OBTURATION
      #pragma target 3.0
      #pragma vertex vert_img
      #pragma fragment frag_linear
      ENDCG
    }
  }

  Fallback off
}
