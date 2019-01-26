using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpdateRotation : MonoBehaviour {

	// Update is called once per frame
	void Update () {
        foreach(Transform tra in gameObject.transform)
        {
            tra.RotateAround(tra.position, Vector3.up, 0.1f);
        }
	}
}
