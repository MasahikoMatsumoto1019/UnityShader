Shader "Custom/RGBCube_OutQualifier"
{
   // RGBキューブ
   // Debugging of Shaders
   Properties
   {
       _X("x",float) = 0.5
       _Y("y",float) = 0.5
       _Z("z",float) = 0.5
   }
   SubShader {
        Pass {
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            
            uniform float _X;
            uniform float _Y;
            uniform float _Z;
            
            struct vertexOutput {
                float4 pos : SV_POSITION;
                float4 col : TEXCOORD0;
            };
            
            vertexOutput vert(float4 vertexPos : POSITION)
            {
                vertexOutput output;
                
                output.pos = UnityObjectToClipPos(vertexPos);
                output.col = vertexPos + float4(_X, _Y, _Z, 0.0);
                return output;
            }
            
            float4 frag(vertexOutput input) : COLOR
            {
                return input.col;
            }
            ENDCG
        }
   }
   
   // 構造体を作らずvert関数の引数をout修飾子で書いた場合
   // 処理自体は一緒
   //SubShader { 
   //   Pass { 
   //      CGPROGRAM 
 
   //      #pragma vertex vert
   //      #pragma fragment frag
 
   //      // out修飾子
   //      void vert(float4 vertexPos : POSITION,
   //         out float4 pos : SV_POSITION,
   //         out float4 col : TEXCOORD0)  
   //      {
   //         pos = UnityObjectToClipPos(vertexPos);
   //         col = vertexPos + float4(0.5, 0.5, 0.5, 0.0);
   //         return;
   //      }
         
   //      // frag
   //      float4 frag(float4 pos : SV_POSITION, 
   //         float4 col : TEXCOORD0) : COLOR 
   //      {
   //         return col; 
   //      }
 
   //      ENDCG 
   //   }
   //}
}