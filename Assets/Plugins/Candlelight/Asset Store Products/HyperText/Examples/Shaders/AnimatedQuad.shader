// UNITY_SHADER_NO_UPGRADE
Shader "UI/Candlelight/Animated Quad"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Color) = (1,1,1,1)
		_Speed ("Speed", Float) = -8
		_Cells ("Cells", Float) = 16
		
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255

		_ColorMask ("Color Mask", Float) = 15

		[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
	}

	SubShader
	{
		Tags
		{ 
			"Queue"="Transparent" 
			"IgnoreProjector"="True" 
			"RenderType"="Transparent" 
			"PreviewType"="Plane"
			"CanUseSpriteAtlas"="True"
		}
		
		Stencil
		{
			Ref [_Stencil]
			Comp [_StencilComp]
			Pass [_StencilOp] 
			ReadMask [_StencilReadMask]
			WriteMask [_StencilWriteMask]
		}

		Cull Off
		Lighting Off
		ZWrite Off
		ZTest [unity_GUIZTestMode]
		Fog { Mode Off }
		Blend SrcAlpha OneMinusSrcAlpha
		ColorMask [_ColorMask]

		Pass
		{
			Name "Default"
		CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 2.0

			#include "UnityCG.cginc"
			#include "UnityUI.cginc"

			#pragma multi_compile __ UNITY_UI_ALPHACLIP
			
			struct appdata_t
			{
				float4 vertex   : POSITION;
				float4 color    : COLOR;
				float2 texcoord : TEXCOORD0;
#if UNITY_VERSION >= 550
				UNITY_VERTEX_INPUT_INSTANCE_ID
#endif
			};

			struct v2f
			{
				float4 vertex   : SV_POSITION;
				fixed4 color    : COLOR;
				float2 texcoord  : TEXCOORD0;
				float4 worldPosition : TEXCOORD1;
#if UNITY_VERSION >= 550
				UNITY_VERTEX_OUTPUT_STEREO
#endif
			};

			float _Cells;
			float _Speed;

			fixed4 _Color;
			fixed4 _TextureSampleAdd;
			float4 _ClipRect;

			v2f vert(appdata_t IN)
			{
				v2f OUT;
#if UNITY_VERSION >= 550
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(OUT);
#endif
				OUT.worldPosition = IN.vertex;
#if UNITY_VERSION >= 540
				OUT.vertex = UnityObjectToClipPos(OUT.worldPosition);
#else
				OUT.vertex = mul(UNITY_MATRIX_MVP, OUT.worldPosition);
#endif

				OUT.texcoord = IN.texcoord;
				OUT.texcoord.y += frac(floor(_Time.y * _Speed) / _Cells);

#if UNITY_VERSION < 550
	#ifdef UNITY_HALF_TEXEL_OFFSET
		#if UNITY_VERSION >= 540
				OUT.vertex.xy += (_ScreenParams.zw - 1.0) * float2(-1, 1) * OUT.vertex.w;
		#else
				OUT.vertex.xy += (_ScreenParams.zw - 1.0) * float2(-1, 1);
		#endif
	#endif
#endif

				OUT.color = IN.color * _Color;
				return OUT;
			}

			sampler2D _MainTex;

			fixed4 frag(v2f IN) : SV_Target
			{
				half4 color = (tex2D(_MainTex, IN.texcoord) + _TextureSampleAdd) * IN.color;
				
				color.a *= UnityGet2DClipping(IN.worldPosition.xy, _ClipRect);
				
				#ifdef UNITY_UI_ALPHACLIP
				clip (color.a - 0.001);
				#endif

				return color;
			}
		ENDCG
		}
	}
}
