using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectManager : MonoBehaviour
{
    public static ObjectManager Instance;
    public static GameObject InGameCanvas;
    public static GameObject InGamePanel;
    public static GameObject SummaryPanel;
    public static GameObject CurrentPlayerWordText;
    public static GameObject CurrentLevelText;
    public static GameObject CurrentWordsDoneLevelText;
    public static GameObject CurrentWordText;
    public static GameObject TutorialPanel;
    public static GameObject StartGameButton;
    public static GameObject WelcomePanel;
    public static GameObject GoToTutorialButton;
    public static GameObject MainCamera;
    public static GameObject MenuCanvas;
    public static GameObject FeedbackPanel;
    public static GameObject ScoreText;
    public static GameObject FeedbackText;

    void Awake() {
        Instance = this;
    }
    void Start()
    {
        InGameCanvas = GameObject.Find("InGameCanvas");
        InGamePanel = GameObject.Find("InGamePanel");
        SummaryPanel = GameObject.Find("SummaryPanel");
        CurrentPlayerWordText = GameObject.Find("CurrentPlayerWordText");
        CurrentLevelText = GameObject.Find("CurrentLevelText");
        CurrentWordsDoneLevelText = GameObject.Find("CurrentWordsDoneLevelText");
        CurrentWordText = GameObject.Find("CurrentWordText");
        TutorialPanel = GameObject.Find("TutorialPanel");
        StartGameButton = GameObject.Find("StartGameButton");
        WelcomePanel = GameObject.Find("WelcomePanel");
        GoToTutorialButton = GameObject.Find("GoToTutorialButton");
        MainCamera = GameObject.Find("Main Camera");
        MenuCanvas = GameObject.Find("MenuCanvas");
        FeedbackPanel = GameObject.Find("FeedbackPanel");
        ScoreText = GameObject.Find("ScoreText");
        FeedbackText = GameObject.Find("FeedbackText");

        SummaryPanel.SetActive(false);
        InGameCanvas.SetActive(false);

        TutorialPanel.SetActive(false);
        StartGameButton.SetActive(false);
    }
}
