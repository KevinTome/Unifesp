using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;

public class SimpleObjectInteraction : MonoBehaviour
{

  GameManager GameManager;

  public void Start() {
    GameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
  }

  public void HoverOver() {
    GetComponent<Renderer>().material.EnableKeyword("_EMISSION");
  }

  public void HoverEnd() {
    GetComponent<Renderer>().material.DisableKeyword("_EMISSION");
  }  

  public void OnClick(SelectEnterEventArgs args) {
    GameManager.OnElementSelect(args.interactableObject.transform.name);
  }
}
