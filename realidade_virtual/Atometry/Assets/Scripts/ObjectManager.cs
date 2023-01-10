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
    public static GameObject FeedbackAnswerPanel;
    public static GameObject ScoreText;
    public static GameObject FeedbackText;
    public static GameObject TimerText;
    public static GameObject SummaryTimerText;
    public static GameObject FeedbackCanvas;
    public static GameObject FeedbackAnswersText;

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
        FeedbackAnswerPanel = GameObject.Find("FeedbackAnswerPanel");
        ScoreText = GameObject.Find("ScoreText");
        FeedbackText = GameObject.Find("FeedbackText");
        TimerText = GameObject.Find("TimerText");
        SummaryTimerText = GameObject.Find("SummaryTimerText");
        FeedbackCanvas = GameObject.Find("FeedbackCanvas");
        FeedbackAnswersText = GameObject.Find("FeedbackAnswersText");

        SummaryPanel.SetActive(false);
        InGameCanvas.SetActive(false);

        TutorialPanel.SetActive(false);
        StartGameButton.SetActive(false);

        FeedbackCanvas.SetActive(false);
    }
}
