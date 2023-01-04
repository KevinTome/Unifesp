using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckButtonInteraction : MonoBehaviour
{
  GameManager GameManager;

  public void Start() {
    GameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
  }

  public void OnClick() {
    GameManager.CheckAnswer();
  }

  public void OnReset() {
    GameManager.ResetAnswer();
  }  
}
