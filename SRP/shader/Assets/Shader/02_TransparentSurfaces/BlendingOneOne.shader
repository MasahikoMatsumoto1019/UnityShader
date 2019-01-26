// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/blendingOneOne" {
    SubShader {
        Tags { "Queue" = "Transparent" }

        Pass{
            Zwrite Off
            
            Blend One One
            
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