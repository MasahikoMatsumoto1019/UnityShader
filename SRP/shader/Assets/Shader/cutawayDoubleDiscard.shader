// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/cutawayDoubleDiscord" {
    SubShader{
        Pass{
            Cull Front // カリングで必要な宣言
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            
            struct InputVert
            {
                float4 position : POSITION;
            };
            
            struct OutPutVert
            {
                float4 position : SV_POSITION;
                float4 positionObject : TEXCOORD0;
            };
            
            OutPutVert vert(InputVert vert)
            {
                OutPutVert outputVert;
                
                outputVert.position = UnityObjectToClipPos(vert.position);
                outputVert.positionObject = vert.position;
                
                return outputVert;
            }
            
            float4 frag(OutPutVert vert) : COLOR
            {
                if(vert.positionObject.y > 4.0f)
                {
                    discard;
                }
                return float4(1.0,1.0,0.0,1.0);
            }
            
            ENDCG
        }
        
        Pass{
            Cull Back // カリングで必要な宣言
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            
            struct InputVert
            {
                float4 position : POSITION;
            };
            
            struct OutPutVert
            {
                float4 position : SV_POSITION;
                float4 positionObject : TEXCOORD0;
            };
            
            OutPutVert vert(InputVert vert)
            {
                OutPutVert outputVert;
                
                outputVert.position = UnityObjectToClipPos(vert.position);
                outputVert.positionObject = vert.position;
                
                return outputVert;
            }
            
            float4 frag(OutPutVert vert) : COLOR
            {
                if(vert.positionObject.y > 0.0f)
                {
                    discard;
                }
                return float4(0.0,1.0,0.0,1.0);
            }
            
            ENDCG
        }
    }
}
