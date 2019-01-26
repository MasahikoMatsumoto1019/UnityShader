// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custon/EMReflectionSphere" {
   Properties {
      _Cube("Reflection Map", Cube) = "" {}
   }
   SubShader {
      Pass {   
         CGPROGRAM
 
         #pragma vertex vert  
         #pragma fragment frag

         #include "UnityCG.cginc" // include

         // User-specified uniforms
         uniform samplerCUBE _Cube;

         struct vertexInput {
            float4 vertex : POSITION; //basyo
            float3 normal : NORMAL; //housen
         };
         struct vertexOutput {
            float4 pos : SV_POSITION; //Unity position
            float3 normalDir : TEXCOORD0; //UV1
            float3 viewDir : TEXCOORD1; //UV2
         };
 
         vertexOutput vert(vertexInput input) 
         {
            vertexOutput output;
            
            // モデルの行列
            float4x4 modelMatrix = unity_ObjectToWorld;
            // WORLD行列の逆変換
            float4x4 modelMatrixInverse = unity_WorldToObject; 
 
            // 座標空間を合わせる感じ
            // UV2にモデルの行列とマテリアルの場所を賭けて_WorldSpaceCameraPos(カメラのワールド空間位置)を引く
            // カメラのワールド空間位置
            output.viewDir = mul(modelMatrix, input.vertex).xyz 
               - _WorldSpaceCameraPos;
            // UV1にWORLD行列の逆変換したものとマテリアルの法線を掛けたものを正規化
            output.normalDir = normalize(
               mul(float4(input.normal, 0.0), modelMatrixInverse).xyz);
            // 出力場所をマテリアルの場所にする
            output.pos = UnityObjectToClipPos(input.vertex);
            return output;
         }
 
         float4 frag(vertexOutput input) : COLOR
         {
            // リフレクト関数でカメラからオブジェクトまでの距離と逆WORLDを表示する法線をリフレクトする？？？
            float3 reflectedDir = 
               reflect(input.viewDir, normalize(input.normalDir));
            // 結果の色をフラグメントに格納する
            return texCUBE(_Cube, reflectedDir);
         }
 
         ENDCG
      }
   }
}