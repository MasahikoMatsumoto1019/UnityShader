using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpdateRotation : MonoBehaviour {

    public static UpdateRotation I;

    public A dialog;
    public float angle = 0.1f;
	// Update is called once per frame
	void Update () {
        foreach(Transform tra in gameObject.transform)
        {
            tra.RotateAround(tra.position, Vector3.up, angle);
        }
	}

    // 再帰処理テスト

    private IEnumerator Start()
    {
        I = this;
        yield return a();
        Debug.Log("StartEnd");
    }

    IEnumerator a()
    {
        dialog.Open(a);
        while (dialog.wait) yield return null;
        Debug.Log("a");
        yield return null;
    }
}