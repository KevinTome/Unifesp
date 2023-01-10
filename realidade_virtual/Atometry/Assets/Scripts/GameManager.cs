using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
 using UnityEngine.UI;
using TMPro;

class Element {
  public string name;
  public string shortName;
  public string formula;
  public int isDone; // 1, 0, -1
  public Element(string name, string shortName, string formula = "") {
    this.name = name;
    this.shortName = shortName;
    this.formula = formula;
    this.isDone = 0;
  }
};

class ElementCounter {
  public string shortName;
  public int amount;
  public ElementCounter(string shortName) {
    this.shortName = shortName;
    this.amount = 0;
  }
};
public class GameManager : MonoBehaviour
{
  private static System.Random rng = new System.Random();
  public static GameManager Instance;
  public GameState State;
  public static event Action<GameState> OnGameStateChanged;

  private string[] scores = {
    "F",
    "D-",
    "D",
    "D+",
    "C-",
    "C",
    "C+",
    "B-",
    "B",
    "B+",
    "A-",
    "A",
    "A+",
  };

  // External references
  ObjectManager ObjectManager;
  public AudioSource successAudio;
  public AudioSource failureAudio;

  // State variables
  private static int currentLevel = 1;
  private static int currentLevelWordsDone = -1;
  private static List<ElementCounter> currentPlayerAnswer;
  private static List<List<Element>> wordsList;
  private static int successAnswers = 0;
  public static float[] timer = {0, 0};
  private static int[] totalWordsPerLevel = {0, 3, 4, 6};
  
  void Awake() {
    Instance = this;
  }

  void Start() {
    // Set external references
    ObjectManager = GameObject.Find("ObjectManager").GetComponent<ObjectManager>();

    currentPlayerAnswer = new List<ElementCounter>();

    wordsList = new List<List<Element>>{
      new List<Element>{new Element("", "", "")},
      new List<Element>{
        new Element("Ácido Clorídrico", "-", "HCl"),
        new Element("Ácido Sulfídrico", "-", "H2S"),
        new Element("Hidróxido de Sódio", "-", "NaOH"),
        new Element("Hidróxido de Lítio", "-", "LiOH"),
        new Element("Cloreto de Sódio", "-", "NaCl"),
        new Element("Sulfato de Cálcio", "-", "CaSO4"),
      },
     new List<Element>{
        new Element("Ácido Cianídrico", "-", "HCN"),
        new Element("Ácido Nítrico", "-", "HNO3"),
        new Element("Hidróxido de Cálcio", "-", "CaO2H2"),
        new Element("Hidróxido de Alumínio", "-", "AlO3H3"),
        new Element("Fosfato de Potássio", "-", "K3PO4"),
        new Element("Sulfato de cobre I", "-", "Cu2SO4"),
      },
      new List<Element>{
        new Element("Mono-hidrogeno-carbonato de sódio", "-", "NaHCO3"),          
        new Element("Nitrito de Alumínio", "-", "AlN3O6"),
        new Element("Hidróxido férrico", "-", "FeO3H3"),
        new Element("Hidróxido de ferro II", "-", "FeO2H2"),
        new Element("Ácido carbônico", "-", "H2CO3"),
        new Element("Ácido Sulfúrico", "-", "H2SO4"),
      }
    };

    UpdateGameState(GameState.NextLevel);
  }
  
  public void UpdateGameState(GameState newState) {
    State = newState;

    switch (newState)
    {
      case GameState.PlayerTurn:
          break;
      case GameState.Success:
          break;
      case GameState.Fail:
          break;
      case GameState.ScoreSummary:
          break;
      case GameState.NextLevel:
          HandleNextLevel();
          break;    
      case GameState.NextWord:
          HandleNextWord();
          break;                                  
      default:
          break;
    }
    OnGameStateChanged?.Invoke(newState);  
  }

  private static string GetFeedbackText() {
    string finalText = "";

    var doneWordsList = new List<List<Element>>(wordsList);

    for (int i = 1; i < doneWordsList.Count; i++){
      doneWordsList[i] = doneWordsList[i].FindAll((el) => el.isDone != 0);
    }

    for (int j = 1; j < doneWordsList.Count; j++) {
      finalText = finalText + "\nLevel" + j + "\n";
      for (int k = 0; k < totalWordsPerLevel[j]; k++)
      {
        finalText = finalText + "\n" + doneWordsList[j][k].name + "(" + doneWordsList[j][k].formula + ")" + " - " + (doneWordsList[j][k].isDone == 1 ? "Acertou" : "Errou");
      }
      finalText = finalText + "\n-------------------------------------------------------------";
    }
    
    return finalText;
  }
  private void HandleNextLevel() {
    ResetAnswer();
    currentLevelWordsDone++;

    if(currentLevelWordsDone == totalWordsPerLevel[currentLevel]) { // Go to next level

      if(currentLevel == (wordsList.Count - 1)) { // Game is over
        timer[1] = 0;
        ObjectManager.InGamePanel.SetActive(false);
        ObjectManager.SummaryPanel.SetActive(true);
        ObjectManager.FeedbackCanvas.SetActive(true);

        Destroy(ObjectManager.MainCamera.GetComponent<ElementsBuilder>().ElementsGroup);

        ObjectManager.ScoreText.GetComponent<TextMeshProUGUI>().text = scores[successAnswers];
        ObjectManager.FeedbackText.GetComponent<TextMeshProUGUI>().text = (successAnswers > 6) ? "Parabéns!" : "Tente novamente...";

        ObjectManager.FeedbackAnswersText.GetComponent<TextMeshProUGUI>().text = GetFeedbackText();
        
        TimeSpan time = TimeSpan.FromSeconds(timer[0]);
        ObjectManager.SummaryTimerText.GetComponent<TextMeshProUGUI>().text = time.ToString("mm':'ss");
        return;
      }
      currentLevel++;
      currentLevelWordsDone = 0;
    }

    ObjectManager.CurrentLevelText.GetComponent<TextMeshProUGUI>().text = currentLevel.ToString();
    ObjectManager.CurrentWordsDoneLevelText.GetComponent<TextMeshProUGUI>().text = (currentLevelWordsDone+1).ToString() + "/" +  totalWordsPerLevel[currentLevel];
    UpdateGameState(GameState.NextWord);
  }

   private void HandleNextWord() {
    // 1. Dar shuffle no currentLevel da wordsList
     wordsList[currentLevel] = wordsList[currentLevel].OrderBy(a => rng.Next()).ToList();
    
    // 2. Puxar em ordem, e ir verificando se já está na wordsDoneList
    int i = 0;
    while( wordsList[currentLevel][i].isDone != 0) i++;

    // Update current word label
    ObjectManager.CurrentWordText.GetComponent<TextMeshProUGUI>().text =  wordsList[currentLevel][i].name;

    UpdateGameState(GameState.PlayerTurn);
   }

   public void OnElementSelect(string selectedElementName) {
    var selectedElementIndex = currentPlayerAnswer.FindIndex(element => element.shortName == selectedElementName);

    if(selectedElementIndex == -1) {
      currentPlayerAnswer.Add(new ElementCounter(selectedElementName));
      selectedElementIndex = currentPlayerAnswer.Count - 1;
    }

    currentPlayerAnswer[selectedElementIndex].amount++;
    updateCurrentAnswerUI();
   }

   private void updateCurrentAnswerUI() {
    var elements = currentPlayerAnswer.Select(elementCounter => (elementCounter.shortName+(elementCounter.amount > 1 ? elementCounter.amount : ""))).ToArray();
    ObjectManager.CurrentPlayerWordText.GetComponent<TextMeshProUGUI>().text = string.Join("", elements);
   }

   public void CheckAnswer() {
    var elements = currentPlayerAnswer.Select(elementCounter => (elementCounter.shortName+(elementCounter.amount > 1 ? elementCounter.amount : ""))).ToArray();
    string answer = string.Join("", elements);

    string currentWord = ObjectManager.CurrentWordText.GetComponent<TextMeshProUGUI>().text;
    int doneElementIndex = wordsList[currentLevel].FindIndex((el) => el.name == currentWord);

    // Update done property
    if(wordsList[currentLevel][doneElementIndex].formula == answer) {
      StartCoroutine(fade(new Color(0, 0, 0, 0), new Color(0, 2, 0, 0.1F), 0.4F));
      StartCoroutine(fade(new Color(0, 2, 0, 0.1F), new Color(0, 0, 0, 0), 0.4F));

      successAnswers++;
      wordsList[currentLevel][doneElementIndex].isDone = 1;
      successAudio.Play();
    } else {
      StartCoroutine(fade(new Color(0, 0, 0, 0), new Color(2, 0, 0, 0.1F), 0.4F));
      StartCoroutine(fade(new Color(2, 0, 0, 0.1F), new Color(0, 0, 0, 0), 0.4F));
      wordsList[currentLevel][doneElementIndex].isDone = -1;
      failureAudio.Play();
    }

    UpdateGameState(GameState.NextLevel);
   }

  private IEnumerator fade(Color startValue, Color endValue, float duration){
    float time = 0.0f;
    while (time < duration){
      ObjectManager.FeedbackAnswerPanel.GetComponent<Image>().color = Color.Lerp(startValue, endValue, time/duration);
      time += Time.deltaTime;
        yield return null;
    }
    ObjectManager.FeedbackAnswerPanel.GetComponent<Image>().color = endValue;
  }
  public void ResetAnswer() {
    currentPlayerAnswer.Clear();
    updateCurrentAnswerUI();
  }

  public void Restart() {
    currentLevel = 1;
    currentLevelWordsDone = -1;
    currentPlayerAnswer.Clear();
    successAnswers = 0;

    timer[0] = 0;
    timer[1] = 1;
    TimeSpan time = TimeSpan.FromSeconds(timer[0]);
    ObjectManager.SummaryTimerText.GetComponent<TextMeshProUGUI>().text = time.ToString("mm':'ss");

    for (int i = 1; i < wordsList.Count; i++) {
      for (int j = 0; j < 6; j++) {
        wordsList[i][j].isDone = 0;
      }
    }

    ObjectManager.InGamePanel.SetActive(true);
    ObjectManager.SummaryPanel.SetActive(false);
    ObjectManager.FeedbackCanvas.SetActive(false);
    ObjectManager.MainCamera.GetComponent<ElementsBuilder>().Render();
    updateCurrentAnswerUI();
    UpdateGameState(GameState.NextLevel);
  }

  public void Update() {
    if(timer[1] == 1) {
      timer[0] += Time.deltaTime;
      TimeSpan time = TimeSpan.FromSeconds(timer[0]);
      ObjectManager.TimerText.GetComponent<TextMeshProUGUI>().text = time.ToString("mm':'ss");
    }
  }


  public enum GameState {
    NextLevel,
    NextWord,
    PlayerTurn,
    Success,
    Fail,
    ScoreSummary
  }
}
