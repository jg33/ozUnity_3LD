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
Shader "Hidden/Vintage/EGA"
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
  float _Amount;
  float _Luminosity;

  inline float3 FindClosest(float3 ref)
  {
    float3 old = 25500.0;
    
    #define TRY_COLOR(color) old = lerp(color, old, step(length(old - ref), length(color - ref)));

    TRY_COLOR(float3(000.0, 000.0, 000.0));
    TRY_COLOR(float3(255.0, 255.0, 255.0));
    TRY_COLOR(float3(255.0, 000.0, 000.0));
    TRY_COLOR(float3(000.0, 255.0, 000.0));
    TRY_COLOR(float3(000.0, 000.0, 255.0));
    TRY_COLOR(float3(255.0, 255.0, 000.0));
    TRY_COLOR(float3(000.0, 255.0, 255.0));
    TRY_COLOR(float3(255.0, 000.0, 255.0));
    TRY_COLOR(float3(128.0, 000.0, 000.0));
    TRY_COLOR(float3(000.0, 128.0, 000.0));
    TRY_COLOR(float3(000.0, 000.0, 128.0));
    TRY_COLOR(float3(128.0, 128.0, 000.0));
    TRY_COLOR(float3(000.0, 128.0, 128.0));
    TRY_COLOR(float3(128.0, 000.0, 128.0));
    TRY_COLOR(float3(128.0, 128.0, 128.0));
    TRY_COLOR(float3(255.0, 128.0, 128.0));

    #undef TRY_COLOR

    return old;
  }
  
  inline float DitherMatrix(float x, float y)
  {
    return lerp(lerp(lerp(lerp(lerp(lerp(0.0, 32.0, step(1.0, y)), lerp(8.0, 40.0, step(3.0, y)), step(2.0, y)), lerp(lerp(2.0, 34.0, step(5.0, y)), lerp(10.0, 42.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), lerp(lerp(lerp(48.0, 16.0, step(1.0, y)), lerp(56.0, 24.0, step(3.0, y)), step(2.0, y)), lerp(lerp(50.0, 18.0, step(5.0, y)), lerp(58.0, 26.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), step(1.0, x)), lerp(lerp(lerp(lerp(12.0, 44.0, step(1.0, y)), lerp(4.0, 36.0, step(3.0, y)), step(2.0, y)), lerp(lerp(14.0, 46.0, step(5.0, y)), lerp(6.0, 38.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), lerp(lerp(lerp(60.0, 28.0, step(1.0, y)), lerp(52.0, 20.0, step(3.0, y)), step(2.0, y)), lerp(lerp(62.0, 30.0, step(5.0, y)), lerp(54.0, 22.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), step(3.0, x)), step(2.0, x)), lerp(lerp(lerp(lerp(lerp(3.0, 35.0, step(1.0, y)), lerp(11.0, 43.0, step(3.0, y)), step(2.0, y)), lerp(lerp(1.0, 33.0, step(5.0, y)), lerp(9.0, 41.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), lerp(lerp(lerp(51.0, 19.0, step(1.0, y)), lerp(59.0, 27.0, step(3.0, y)), step(2.0, y)), lerp(lerp(49.0, 17.0, step(5.0, y)), lerp(57.0, 25.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), step(5.0, x)), lerp(lerp(lerp(lerp(15.0, 47.0, step(1.0, y)), lerp(7.0, 39.0, step(3.0, y)), step(2.0, y)), lerp(lerp(13.0, 45.0, step(5.0, y)), lerp(5.0, 37.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), lerp(lerp(lerp(63.0, 31.0, step(1.0, y)), lerp(55.0, 23.0, step(3.0, y)), step(2.0, y)), lerp(lerp(61.0, 29.0, step(5.0, y)), lerp(53.0, 21.0, step(7.0, y)), step(6.0, y)), step(4.0, y)), step(7.0, x)), step(6.0, x)), step(4.0, x));
  }

  inline float3 Dither(float3 color, float2 uv)
  {
    color *= 255.0 * _Luminosity * 0.9;
    color += DitherMatrix(fmod(uv.x, 8.0), fmod(uv.y, 8.0));
    color = FindClosest(clamp(color, 0.0, 255.0));
		
    return color / 255.0;
  }

  float4 frag_gamma(v2f_img i) : COLOR
  {
    float3 pixel = tex2D(_MainTex, i.uv).rgb;
    float3 final = pixel;

#ifdef EFFECT_ENABLED

    final = Dither(final, i.uv * _ScreenParams.xy);

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

    return float4(final, 1.0);
  }

  float4 frag_linear(v2f_img i) : COLOR
  {
    float3 pixel = sRGB(tex2D(_MainTex, i.uv).rgb);
    float3 final = pixel;

#ifdef EFFECT_ENABLED

    final = Dither(final, i.uv * _ScreenParams.xy);

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
      #pragma target 3.0
      #pragma vertex vert_img
      #pragma fragment frag_linear
      ENDCG
    }
  }

  Fallback off
}
