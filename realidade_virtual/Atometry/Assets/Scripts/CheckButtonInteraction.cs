using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckButtonInteraction : MonoBehaviour
{
  GameManager GameManager;
  GameObject WelcomePanel;
  GameObject GoToTutorialButton;
  ObjectManager ObjectManager;
  public AudioSource clickAudio;

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
    clickAudio.Play();
    ObjectManager.MainCamera.GetComponent<ElementsBuilder>().Render();
    ObjectManager.MenuCanvas.SetActive(false);
    ObjectManager.InGameCanvas.SetActive(true);
    GameManager.timer[1] = 1;
  }

  public void OnExit() {
    Application.Quit();
    UnityEditor.EditorApplication.isPlaying = false;
  }
}
