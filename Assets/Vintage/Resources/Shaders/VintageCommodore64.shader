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
Shader "Hidden/Vintage/Commodore 64"
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
    float _PixelSize;
    float _DitherSaturation;
    float _DitherNoise;

    inline float Hash(float2 p)
    {
      return frac(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x))));
    }

    inline float Compare(float3 a, float3 b)
    {
      a = max(0.0, a - min(a.r, min(a.g, a.b)) * 0.25 * _DitherSaturation);
      b = max(0.0, b - min(b.r, min(b.g, b.b)) * 0.25 * _DitherSaturation);
      
      a *= a * a;
      b *= b * b;
      
      float3 diff = (a - b);

      return dot(diff, diff);
    }

    float4 frag_gamma(v2f_img i) : COLOR
    {
      float3 pixel = tex2D(_MainTex, i.uv).rgb;
      float3 final = pixel;

#ifdef EFFECT_ENABLED

      float2 c = floor((i.uv * _ScreenParams.xy) / _PixelSize);
      float2 coord = c * _PixelSize;
      float3 src = tex2D(_MainTex, coord / _ScreenParams.xy).rgb;

      float3 dst0 = 0.0;
      float3 dst1 = 0.0;
      float best0 = 1e3;
      float best1 = 1e3;
      
      #define TRY_COLOR(R, G, B) { const float3 tst = float3(R, G, B); float err = Compare(src, tst); if (err < best0) { best1 = best0; dst1 = dst0; best0 = err; dst0 = tst; } }

      TRY_COLOR(0.078431, 0.047059, 0.109804);
      TRY_COLOR(0.266667, 0.141176, 0.203922);
      TRY_COLOR(0.188235, 0.203922, 0.427451);
      TRY_COLOR(0.305882, 0.290196, 0.305882);
      TRY_COLOR(0.521569, 0.298039, 0.188235);
      TRY_COLOR(0.203922, 0.396078, 0.141176);
      TRY_COLOR(0.815686, 0.274510, 0.282353);
      TRY_COLOR(0.458824, 0.443137, 0.380392);
      TRY_COLOR(0.349020, 0.490196, 0.807843);
      TRY_COLOR(0.823529, 0.490196, 0.172549);
      TRY_COLOR(0.521569, 0.584314, 0.631373);
      TRY_COLOR(0.427451, 0.666667, 0.172549);
      TRY_COLOR(0.823529, 0.666667, 0.600000);
      TRY_COLOR(0.427451, 0.760784, 0.792157);
      TRY_COLOR(0.854902, 0.831373, 0.368627);
      TRY_COLOR(0.870588, 0.933333, 0.839216);
      
      #undef TRY_COLOR

      best0 = sqrt(best0);
      best1 = sqrt(best1);

      final = fmod(c.x + c.y, 2.0 * _DitherNoise) > (Hash(c * 2.0 * _DitherNoise + frac(sin(float2(floor(1.9 * _DitherNoise), floor(1.7 * _DitherNoise))))) * 0.75 * _DitherNoise) + (best1 / (best0 + best1)) ? dst1 : dst0;

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

      float2 c = floor((i.uv * _ScreenParams.xy) / _PixelSize);
      float2 coord = c * _PixelSize;
      float3 src = sRGB(tex2D(_MainTex, coord / _ScreenParams.xy).rgb);

      float3 dst0 = 0.0;
      float3 dst1 = 0.0;
      float best0 = 1e3;
      float best1 = 1e3;

#define TRY_COLOR(R, G, B) { const float3 tst = float3(R, G, B); float err = Compare(src, tst); if (err < best0) { best1 = best0; dst1 = dst0; best0 = err; dst0 = tst; } }

      TRY_COLOR(0.078431, 0.047059, 0.109804);
      TRY_COLOR(0.266667, 0.141176, 0.203922);
      TRY_COLOR(0.188235, 0.203922, 0.427451);
      TRY_COLOR(0.305882, 0.290196, 0.305882);
      TRY_COLOR(0.521569, 0.298039, 0.188235);
      TRY_COLOR(0.203922, 0.396078, 0.141176);
      TRY_COLOR(0.815686, 0.274510, 0.282353);
      TRY_COLOR(0.458824, 0.443137, 0.380392);
      TRY_COLOR(0.349020, 0.490196, 0.807843);
      TRY_COLOR(0.823529, 0.490196, 0.172549);
      TRY_COLOR(0.521569, 0.584314, 0.631373);
      TRY_COLOR(0.427451, 0.666667, 0.172549);
      TRY_COLOR(0.823529, 0.666667, 0.600000);
      TRY_COLOR(0.427451, 0.760784, 0.792157);
      TRY_COLOR(0.854902, 0.831373, 0.368627);
      TRY_COLOR(0.870588, 0.933333, 0.839216);

#undef TRY_COLOR

      best0 = sqrt(best0);
      best1 = sqrt(best1);

      final = fmod(c.x + c.y, 2.0 * _DitherNoise) > (Hash(c * 2.0 * _DitherNoise + frac(sin(float2(floor(1.9 * _DitherNoise), floor(1.7 * _DitherNoise))))) * 0.75 * _DitherNoise) + (best1 / (best0 + best1)) ? dst1 : dst0;

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
      Fog{ Mode off }

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
