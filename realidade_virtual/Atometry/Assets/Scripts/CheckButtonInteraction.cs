using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckButtonInteraction : MonoBehaviour
{
  GameManager GameManager;
  GameObject WelcomePanel;
  GameObject GoToTutorialButton;
  ObjectManager ObjectManager;

  public void Start() {
    ObjectManager = GameObject.Find("ObjectManager").GetComponent<ObjectManager>();
    GameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
    WelcomePanel = GameObject.Find("WelcomePanel");
    GoToTutorialButton = GameObject.Find("GoToTutorialButton");
  }

  public void OnClick() {
    GameManager.CheckAnswer();
  }

  public void OnReset() {
    GameManager.ResetAnswer();
  }  

  public void OnRestart() {
    GameManager.Restart();
  }

  public void GoToTutorialClick() {
    ObjectManager.WelcomePanel.SetActive(false);
    ObjectManager.GoToTutorialButton.SetActive(false);
    ObjectManager.TutorialPanel.SetActive(true);
    ObjectManager.StartGameButton.SetActive(true);
  }

  public void StartGameClick() {
    ObjectManager.MainCamera.GetComponent<ElementsBuilder>().enabled = true;
    ObjectManager.MenuCanvas.SetActive(false);
    ObjectManager.InGameCanvas.SetActive(true);
  }

  public void OnExit() {
    Application.Quit();
    UnityEditor.EditorApplication.isPlaying = false;
  }
}
