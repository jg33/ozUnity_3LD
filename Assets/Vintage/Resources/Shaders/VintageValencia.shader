///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
Shader "Hidden/Vintage/Valencia"
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
  sampler2D _LevelsTex;
  sampler2D _GradientLevelsTex;

  float4x4 saturateMatrix = float4x4(1.1402f, -0.0598f, -0.061f,  0.0f,
                                    -0.1174f,  1.0826f, -0.1186f, 0.0f,
                                    -0.0228f, -0.0228f,  1.1772f, 0.0f,
                                     0.0f,     0.0f,     0.0f,    0.0);

  float _Amount = 1.0f;

  float4 frag_gamma(v2f_img i) : COLOR
  {
    float3 pixel = tex2D(_MainTex, i.uv).rgb;
    float3 final = pixel;

#ifdef EFFECT_ENABLED

    final = PixelLevels(_LevelsTex, pixel);

    final = mul((float3x3)saturateMatrix, final);

    float luma = 1.0f - Desaturate(final);

    final.r = tex2D(_GradientLevelsTex, float2(final.r, luma)).r;
    final.g = tex2D(_GradientLevelsTex, float2(final.g, luma)).g;
    final.b = tex2D(_GradientLevelsTex, float2(final.b, luma)).b;

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

    final = sRGB(PixelLevels(_LevelsTex, pixel));

    final = mul((float3x3)saturateMatrix, final);

    float luma = 1.0f - Desaturate(final);

    final.r = sRGB(tex2D(_GradientLevelsTex, float2(final.r, luma)).rgb).r;
    final.g = sRGB(tex2D(_GradientLevelsTex, float2(final.g, luma)).rgb).g;
    final.b = sRGB(tex2D(_GradientLevelsTex, float2(final.b, luma)).rgb).b;

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
