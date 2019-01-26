// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/CutAwayDiscard" {
   SubShader {
      Pass {
         Cull Off // turn off triangle culling, alternatives are:
         // Cull Back (or nothing): cull only back faces 
         // Cull Front : cull only front faces
 
         CGPROGRAM 
 
         #pragma vertex vert  
         #pragma fragment frag 
 
         struct vertexInput {
            float4 vertex : POSITION;
            float4 texcoord : TEXCOORD0;
            float4 texcoord1 : TEXCOORD1;
            float4 texcoord2 : TEXCOORD2;
            float4 texcoord3 : TEXCOORD3;   

         };
         struct vertexOutput {
            float4 pos : SV_POSITION;
            float4 posInObjectCoords : TEXCOORD0;
            float4 col : TEXCOORD3; 
         };
 
         vertexOutput vert(vertexInput input) 
         {
            vertexOutput output;
 
            output.pos =  UnityObjectToClipPos(input.vertex);
            output.posInObjectCoords = input.vertex; 
            output.col = input.texcoord1;
            return output;
         }
 
         float4 frag(vertexOutput input) : COLOR 
         {
            if (input.posInObjectCoords.x > 0.4) 
            {
               discard; // drop the fragment if y coordinate > 0
            }
            return input.col;
            //return float4(0.0, 1.0, 0.0, 1.0); // green
         }
 
         ENDCG  
      }
   }
}