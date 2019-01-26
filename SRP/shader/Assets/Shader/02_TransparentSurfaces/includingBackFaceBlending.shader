Shader "Custom/includingBackFaceBlending" {
    SubShader
    {
        Tags { "Queue" = "Transparent" }

        Pass
        {
            Cull Front
            Zwrite Off
            
            //透明なオブジェクトは内側も描画する必要がある。カリングOffにする
            // 表示が崩れない様に内部からレンダリング
            //Blend SrcAlpha OneMinusSrcAlpha
            //Blend SrcColor One
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
        
        Pass
        {
            Cull Back
            Zwrite Off
            
            //Blend SrcAlpha OneMinusSrcAlpha
            //Blend Zero
            //Blend SrcColor One
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
}
