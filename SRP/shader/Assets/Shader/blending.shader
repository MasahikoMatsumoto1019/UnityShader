// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/blending" {
	SubShader {
        // 不透明なメッシュを描画した後に透明なメッシュを描画する
		Tags { "Queue" = "Transparent" }

        Pass{
            // デプスバッファの書き込みを無効化する
            // デプスが大きい物を破棄してしまうと透明な場合は困るため
            Zwrite Off
            
            // ブレンド方程式
            Blend SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            float4 vert(float4 vertexPosition : POSITION) : SV_POSITION
            {
                return UnityObjectToClipPos(vertexPosition);
            }
            
            float4 frag(void) : COLOR
            {
                return float4(0.0, 1.0, 0.0, 0.3);
            }
            ENDCG
        }
	}
	//FallBack "Diffuse"
}
