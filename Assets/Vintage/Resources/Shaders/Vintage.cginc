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

// Do not activate. Only to promotional videos.
//#define ENABLE_ALL_DEMO

inline float4 Random(float2 uv)
{
  float noise = sin(dot(uv + _Time.y, float2(12.9898, 78.233))) * 43758.5453;

  float4 res;

  res.x = frac(noise * 0.573);
  res.y = frac(noise * 1.085);
  res.z = frac(noise * 1.226);
  res.w = frac(noise * 0.782);

  return (res * 2.0) - 1.0;
}

// Gamma <-> Linear.
inline float3 sRGB(float3 pixel)
{
  return (pixel <= float3(0.0031308f, 0.0031308f, 0.0031308f)) ? pixel * 12.9232102f : 1.055f * pow(pixel, 0.41666f) - 0.055f;
}

// Gamma <-> Linear.
inline float3 Linear(float3 pixel)
{
  return (pixel <= float3(0.0404482f, 0.0404482f, 0.0404482f)) ? pixel / 12.9232102f : pow((pixel + 0.055f) * 0.9478672f, 2.4f);
}

// Desaturate.
inline float Desaturate(float3 pixel)
{
  return dot(float3(0.3f, 0.59f, 0.11f), pixel);
}

inline float Fade(float t)
{
  return t * t * t * ((t * ((t * 6.0) - 15.0)) + 10.0);
}

// Strength of the effect.
inline float3 PixelAmount(float3 pixel, float3 final, float amount)
{
  return lerp(pixel, final, amount);
}

// Film.
inline float3 PixelFilm(float3 pixel, float2 uv, float noiseStrength, float blinkStrenght)
{
  float2 pf = frac(uv);
  
  float4 n;
  n.x = dot(Random(Random(uv).x).xy, pf);
  n.y = dot(Random(Random(uv).x + float2(0, 1)).xy, pf - float2(0, 1));
  n.z = dot(Random(Random(uv).x + float2(1, 0)).xy, pf - float2(1, 0));
  n.w = dot(Random(Random(uv).x + 1.0).xy, pf - 1.0);
  n.xy = lerp(n.xy, n.zw, Fade(pf.x));

  float grain = lerp(n.x, n.y, Fade(pf.y));

  float lum = Desaturate(pixel) * grain;

  pixel += (grain - lum) * noiseStrength;
  
  pixel *= (1.0f - blinkStrenght) + blinkStrenght * sin(100.0f * _Time.y);

  return pixel;
}

// Corrects the brightness, contrast and gamma.
inline float3 PixelBrightnessContrastGamma(float3 pixel, float brightness, float contrast, float gamma)
{
  pixel = (pixel - 0.5f) * contrast + 0.5f + brightness;

  pixel = clamp(pixel, 0.0f, 1.0f);

  pixel = pow(pixel, gamma);
  
  return pixel;
}

// RGB to HSV
inline float3 RGB2HSV(float3 c)
{
  const float4 K = float4(0.0f, -1.0f / 3.0f, 2.0f / 3.0f, -1.0f);
  float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
  float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));

  float d = q.x - min(q.w, q.y);
  float e = 1.0e-10;

  return float3(abs(q.z + (q.w - q.y) / (6.0f * d + e)), d / (q.x + e), q.x);
}

// HSV to RGB
inline float3 HSV2RGB(float3 c)
{
  const float4 K = float4(1.0f, 2.0f / 3.0f, 1.0f / 3.0f, 3.0f);
  float3 p = abs(frac(c.xxx + K.xyz) * 6.0f - K.www);

  return c.z * lerp(K.xxx, clamp(p - K.xxx, 0.0f, 1.0f), c.y);
}

// http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl
inline float3 PixelHueSaturation(float3 pixel, float hue, float saturation)
{
  float3 hsv = RGB2HSV(pixel);
  
  hsv.x += hue;
  hsv.y *= saturation;

  return HSV2RGB(hsv);
}

// Vignette.
inline float3 Vignette(float3 pixel, float2 uv, float obturation)
{
  float2 tc = (obturation * uv) - (obturation * 0.5f);
  
  float vignette = 1.0f - dot(tc, tc);

  pixel *= vignette * vignette * vignette;

  return pixel;
}

// Color levels.
inline float3 PixelLevels(sampler2D levels, float3 pixel)
{
  pixel.r = tex2D(levels, float2(pixel.r, 1.0f - 0.16666f)).r;
  pixel.g = tex2D(levels, float2(pixel.g, 0.5f)).g;
  pixel.b = tex2D(levels, float2(pixel.b, 1.0f - 0.83333f)).b;

  return pixel;
}

// Texture overlay.
inline float3 PixelBlowoutOverlay(sampler2D blowout, sampler2D overlay, float2 uv, float3 pixel)
{
  float3 bo = tex2D(blowout, uv).rgb;

  float3 final;
  final.r = tex2D(overlay, float2(pixel.r, 1.0f - bo.r)).r;
  final.g = tex2D(overlay, float2(pixel.g, 1.0f - bo.g)).g;
  final.b = tex2D(overlay, float2(pixel.b, 1.0f - bo.b)).b;

  return final;
}

// Texture overlay.
inline float3 PixelBlowoutOverlayStrength(sampler2D blowout, sampler2D overlay, float2 uv, float3 pixel, float strength)
{
  float3 bo = tex2D(blowout, uv).rgb;

  float3 final;
  final.r = tex2D(overlay, float2(pixel.r, 1.0f - bo.r)).r;
  final.g = tex2D(overlay, float2(pixel.g, 1.0f - bo.g)).g;
  final.b = tex2D(overlay, float2(pixel.b, 1.0f - bo.b)).b;

  return lerp(pixel, final, strength);
}

#ifdef ENABLE_ALL_DEMO
inline float3 PixelDemo(float3 pixel, float3 final, float2 uv)
{
  float separator = (sin(_Time.x * 15.0f) * 0.15f) + 0.65f;
  const float separatorWidth = 0.05f;

  if (uv.x > separator)
    final = pixel;
  else if (abs(uv.x - separator) < separatorWidth)
    final = lerp(pixel, final, (separator - uv.x) / separatorWidth);

  return final;
}
#endif

// Color control.
float _Brightness = 0.0f;
float _Contrast = 1.0f;
float _Gamma = 1.0f;
float _Hue = 0.0f;
float _Saturation = 0.0f;

// Film.
float _FilmGrainStrength = 0.0;
float _FilmBlinkStrenght = 0.0;

