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
Shader "Hidden/Vintage/Brannan"
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
  sampler2D _ProcessTex;
  sampler2D _BlowoutTex;
  sampler2D _ContrastTex;
  sampler2D _LumaTex;
  sampler2D _ScreenTex;

  float _Amount = 1.0f;

#define FILM_SCOUNT     512.0    // 0-4096
#define FILM_SINTENSITY 0.60     // 0-1
#define FILM_NINTENSITY 0.50      // 0-1
  float3 filmPass(float3 col, float2 uv) {
    float x = uv.x * uv.y * _Time.y * 1000.0;
    x = fmod(x, 13.0) * fmod(x, 123.0);

    float dx = fmod(x, 0.01);

    float3 cResult = col + col * clamp(0.1 + dx * 100.0, 0.0, 1.0);
    float2 sc = float2(sin(uv.y * FILM_SCOUNT), cos(uv.y * FILM_SCOUNT));
    cResult += col * float3(sc.x, sc.y, sc.x) * FILM_SINTENSITY;
    cResult = col + clamp(FILM_NINTENSITY, 0.0, 1.0) * (cResult - col);

    return cResult;
  }

  float4 frag_gamma(v2f_img i) : COLOR
  {
    float3 pixel = tex2D(_MainTex, i.uv).rgb;
    float3 final = pixel;

#ifdef EFFECT_ENABLED

    // Process.
    float2 lookup;
    lookup.y = 0.5f;
    lookup.x = pixel.r;
    final.r = tex2D(_ProcessTex, lookup).r;
    lookup.x = pixel.g;
    final.g = tex2D(_ProcessTex, lookup).g;
    lookup.x = pixel.b;
    final.b = tex2D(_ProcessTex, lookup).b;

    // Blowout.
    float2 tc = (2.0f * i.uv) - 1.0f;
    float d = dot(tc, tc);
    float3 sampled;
    lookup.x = final.r;
    sampled.r = tex2D(_BlowoutTex, lookup).r;
    lookup.x = final.g;
    sampled.g = tex2D(_BlowoutTex, lookup).g;
    lookup.x = final.b;
    sampled.b = tex2D(_BlowoutTex, lookup).b;
    float value = smoothstep(0.0f, 1.0f, d);
    final = lerp(sampled, final, value);

    // Constrast.
    lookup.x = final.r;
    final.r = tex2D(_ContrastTex, lookup).r;
    lookup.x = final.g;
    final.g = tex2D(_ContrastTex, lookup).g;
    lookup.x = final.b;
    final.b = tex2D(_ContrastTex, lookup).b;

    // Luma.
    lookup.x = Desaturate(final);
    final = lerp(tex2D(_LumaTex, lookup).rgb, final, 0.5f);

    // Screen.
    lookup.x = final.r;
    final.r = tex2D(_ScreenTex, lookup).r;
    lookup.x = final.g;
    final.g = tex2D(_ScreenTex, lookup).g;
    lookup.x = final.b;
    final.b = tex2D(_ScreenTex, lookup).b;

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

    // Process.
    float2 lookup;
    lookup.y = 0.5f;
    lookup.x = pixel.r;
    final.r = sRGB(tex2D(_ProcessTex, lookup).rgb).r;
    lookup.x = pixel.g;
    final.g = sRGB(tex2D(_ProcessTex, lookup).rgb).g;
    lookup.x = pixel.b;
    final.b = sRGB(tex2D(_ProcessTex, lookup).rgb).b;

    // Blowout.
    float2 tc = (2.0f * i.uv) - 1.0f;
    float d = dot(tc, tc);
    float3 sampled;
    lookup.x = final.r;
    sampled.r = sRGB(tex2D(_BlowoutTex, lookup).rgb).r;
    lookup.x = final.g;
    sampled.g = sRGB(tex2D(_BlowoutTex, lookup).rgb).g;
    lookup.x = final.b;
    sampled.b = sRGB(tex2D(_BlowoutTex, lookup).rgb).b;
    float value = smoothstep(0.0f, 1.0f, d);
    final = lerp(sampled, final, value);

    // Constrast.
    lookup.x = final.r;
    final.r = sRGB(tex2D(_ContrastTex, lookup).rgb).r;
    lookup.x = final.g;
    final.g = sRGB(tex2D(_ContrastTex, lookup).rgb).g;
    lookup.x = final.b;
    final.b = sRGB(tex2D(_ContrastTex, lookup).rgb).b;

    // Luma.
    lookup.x = Desaturate(final);
    final = lerp(sRGB(tex2D(_LumaTex, lookup).rgb), final, 0.5f);

    // Screen.
    lookup.x = final.r;
    final.r = sRGB(tex2D(_ScreenTex, lookup).rgb).r;
    lookup.x = final.g;
    final.g = sRGB(tex2D(_ScreenTex, lookup).rgb).g;
    lookup.x = final.b;
    final.b = sRGB(tex2D(_ScreenTex, lookup).rgb).b;

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
