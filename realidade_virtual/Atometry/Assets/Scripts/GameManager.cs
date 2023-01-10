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
  public Element(string name, string shortName, string formula = "") {
    this.name = name;
    this.shortName = shortName;
    this.formula = formula;
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

  // State variables
  private static int currentLevel = 1;
  private static int currentLevelWordsDone = -1;
  private static List<ElementCounter> currentPlayerWord;
  private static List<List<Element>> wordsList;
  private static int successAnswers = 0;
  
  void Awake() {
    Instance = this;
  }

  void Start() {
    // Set external references
    ObjectManager = GameObject.Find("ObjectManager").GetComponent<ObjectManager>();

    currentPlayerWord = new List<ElementCounter>();
    wordsList = new List<List<Element>>{
      new List<Element>{new Element("", "", "")},
      new List<Element>{
        new Element("Ácido Clorídrico", "-", "HCl"),
        new Element("Ácido Sulfídrico", "-", "H2S"),
        new Element("Hidróxido de Sódio", "-", "NaOH"),
      },
     new List<Element>{
        new Element("Ácido Cianídrico", "-", "HCN"),        
        new Element("Hidróxido de Cálcio", "-", "CaO2H2"),
        new Element("Fosfato de Cálcio", "-", "K3PO4"),
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

  private void HandleNextLevel() {
    ResetAnswer();
    currentLevelWordsDone++;

    if(currentLevelWordsDone == wordsList[currentLevel].Count) { // Go to next level

      if(currentLevel == (wordsList.Count - 1)) { // Game is over
        ObjectManager.InGamePanel.SetActive(false);
        ObjectManager.SummaryPanel.SetActive(true);

        ObjectManager.ScoreText.GetComponent<TextMeshProUGUI>().text = scores[successAnswers];
        ObjectManager.FeedbackText.GetComponent<TextMeshProUGUI>().text = (successAnswers > 6) ? "Parabéns!" : "Tente novamente...";
        return;
      }
      currentLevel++;
      currentLevelWordsDone = 0;
    }

    ObjectManager.CurrentLevelText.GetComponent<TextMeshProUGUI>().text = currentLevel.ToString();
    ObjectManager.CurrentWordsDoneLevelText.GetComponent<TextMeshProUGUI>().text =  currentLevelWordsDone.ToString() + "/" + wordsList[currentLevel].Count;
    UpdateGameState(GameState.NextWord);
  }

   private void HandleNextWord() {
    // Update current word label
    ObjectManager.CurrentWordText.GetComponent<TextMeshProUGUI>().text = wordsList[currentLevel][currentLevelWordsDone].name;
    UpdateGameState(GameState.PlayerTurn);
   }

   public void OnElementSelect(string selectedElementName) {
    var selectedElementIndex = currentPlayerWord.FindIndex(element => element.shortName == selectedElementName);

    if(selectedElementIndex == -1) {
      currentPlayerWord.Add(new ElementCounter(selectedElementName));
      selectedElementIndex = currentPlayerWord.Count - 1;
    }

    currentPlayerWord[selectedElementIndex].amount++;
    updateCurrentAnswerUI();
   }

   private void updateCurrentAnswerUI() {
    var elements = currentPlayerWord.Select(elementCounter => (elementCounter.shortName+(elementCounter.amount > 1 ? elementCounter.amount : ""))).ToArray();
    ObjectManager.CurrentPlayerWordText.GetComponent<TextMeshProUGUI>().text = string.Join("", elements);
   }

   public void CheckAnswer() {
    var elements = currentPlayerWord.Select(elementCounter => (elementCounter.shortName+(elementCounter.amount > 1 ? elementCounter.amount : ""))).ToArray();
    string answer = string.Join("", elements);

    if(wordsList[currentLevel][currentLevelWordsDone].formula == answer) {
      StartCoroutine(fade(new Color(0, 0, 0, 0), new Color(0, 2, 0, 0.1F), 0.4F));
      StartCoroutine(fade(new Color(0, 2, 0, 0.1F), new Color(0, 0, 0, 0), 0.4F));

      successAnswers++;
    } else {
      StartCoroutine(fade(new Color(0, 0, 0, 0), new Color(2, 0, 0, 0.1F), 0.4F));
      StartCoroutine(fade(new Color(2, 0, 0, 0.1F), new Color(0, 0, 0, 0), 0.4F));
    }

    UpdateGameState(GameState.NextLevel);
   }

  private IEnumerator fade(Color startValue, Color endValue, float duration){
    float time = 0.0f;
    while (time < duration){
      ObjectManager.FeedbackPanel.GetComponent<Image>().color = Color.Lerp(startValue, endValue, time/duration);
      time += Time.deltaTime;
        yield return null;
    }
    ObjectManager.FeedbackPanel.GetComponent<Image>().color = endValue;
  }
  public void ResetAnswer() {
    currentPlayerWord.Clear();
    updateCurrentAnswerUI();
  }

  public void Restart() {
    currentLevel = 1;
    currentLevelWordsDone = -1;
    currentPlayerWord.Clear();
    successAnswers = 0;

    ObjectManager.InGamePanel.SetActive(true);
    ObjectManager.SummaryPanel.SetActive(false);
    updateCurrentAnswerUI();
    UpdateGameState(GameState.NextLevel);
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
