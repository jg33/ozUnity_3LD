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
Shader "Hidden/Vintage/Crema"
{
  // http://unity3d.com/support/documentation/Components/SL-Properties.html
  Properties
  {
    _MainTex("Base (RGB)", 2D) = "white" {}

    // Default 'Resources/Textures/cremaLut.png'.
    _LutTex("LUT (RGB)", 3D) = "white" {}

    // Amount of the effect (0 none, 1 full).
    _Amount("Amount", Range(0.0, 1.0)) = 1.0
  }

  CGINCLUDE
  #include "UnityCG.cginc"
  #include "Vintage.cginc"

  sampler2D _MainTex;
  sampler3D _LutTex;
  
  float _Amount = 1.0f;
  float _Scale = 1.0f;
  float _Offset = 0.0f;
  
  float4 frag_gamma(v2f_img i) : COLOR
  {
    float3 pixel = tex2D(_MainTex, i.uv).rgb;
    float3 final = pixel;

#ifdef EFFECT_ENABLED

    final = tex3D(_LutTex, (pixel.rgb * _Scale) + _Offset).rgb;

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

    final = tex3D(_LutTex, (pixel.rgb * _Scale) + _Offset).rgb;

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
      #pragma exclude_renderers gles // No sampler3D support in OpenGL ES 2.0.
      #pragma fragmentoption ARB_precision_hint_fastest
      #pragma multi_compile ___ EFFECT_ENABLED
      #pragma multi_compile ___ COLORCONTROL_ENABLED
      #pragma multi_compile ___ FILM_ENABLED
      #pragma target 3.0
      #pragma vertex vert_img
      #pragma fragment frag_gamma
      ENDCG
    }

    // Pass 1: Color Space Linear.
    Pass
    {
      CGPROGRAM
      #pragma exclude_renderers gles // No sampler3D support in OpenGL ES 2.0.
      #pragma fragmentoption ARB_precision_hint_fastest
      #pragma multi_compile ___ EFFECT_ENABLED
      #pragma multi_compile ___ COLORCONTROL_ENABLED
      #pragma multi_compile ___ FILM_ENABLED
      #pragma target 3.0
      #pragma vertex vert_img
      #pragma fragment frag_linear
      ENDCG
    }
  }

  Fallback off
}