using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
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

  // External references
  private static GameObject LevelLabel;
  private static GameObject CurrentWordLabel;
  private static GameObject CurrentPlayerWordLabel;

  // State variables
  private static int currentLevel = 0;
  private static int currentLevelWordsDone = 0;
  private static List<ElementCounter> currentPlayerWord;
  private static List<List<Element>> wordsList;
  
  void Awake() {
    Instance = this;
  }

  void Start() {
    // Set external references
    LevelLabel = GameObject.Find("CurrentLevelText");
    CurrentWordLabel = GameObject.Find("CurrentWordText");
    CurrentPlayerWordLabel = GameObject.Find("CurrentPlayerWordText");

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

      if(currentLevel == (wordsList.Count - 1)) {
        Debug.Log("Game ended");
        return;
      }
      currentLevel++;
      currentLevelWordsDone = 0;
      LevelLabel.GetComponent<TextMeshProUGUI>().text = currentLevel.ToString();
    }
    
    UpdateGameState(GameState.NextWord);
  }

   private void HandleNextWord() {
    // Update current word label
    CurrentWordLabel.GetComponent<TextMeshProUGUI>().text = wordsList[currentLevel][currentLevelWordsDone].name;
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
    CurrentPlayerWordLabel.GetComponent<TextMeshProUGUI>().text = string.Join("", elements);
   }

   public void CheckAnswer() {
    var elements = currentPlayerWord.Select(elementCounter => (elementCounter.shortName+(elementCounter.amount > 1 ? elementCounter.amount : ""))).ToArray();
    string answer = string.Join("", elements);

    if(wordsList[currentLevel][currentLevelWordsDone].formula == answer) {
      UpdateGameState(GameState.NextLevel);
    }
   }

  public void ResetAnswer() {
    currentPlayerWord.Clear();
    updateCurrentAnswerUI();
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
