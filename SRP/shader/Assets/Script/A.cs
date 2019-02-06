using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class A : MonoBehaviour
{
    public bool wait = true;
    Func<IEnumerator> call;
    public void Open(Func<IEnumerator> call)
    {
        wait = true;
        gameObject.SetActive(true);
        this.call = null;
        if (call != null)
        {
            this.call = call;
        }
    }

    public void OnClickBack()
    {
        UpdateRotation.I.StartCoroutine(Boot());
    }

    public IEnumerator Boot()
    {
        Debug.LogWarning("消すよ");
        gameObject.SetActive(false);
        if(this.call != null)
        {
            Debug.LogWarning("call呼ぶよ");
            yield return this.call();
        }
    }

    public void OnClick()
    {
        wait = false;
    }
}
