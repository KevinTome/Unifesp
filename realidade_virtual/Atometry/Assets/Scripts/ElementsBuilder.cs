using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ElementsBuilder : MonoBehaviour
{
  public GameObject ElementPrefab;
  
  void Start()
  {
    Element[] elementsList = {
      new Element("Hidrogênio", "H"), 
      new Element("Cloro", "Cl"), 
      new Element("Enxofre", "S"), 
      new Element("Carbono", "C"),
      new Element("Nitrogênio", "N"),
      new Element("Sódio", "Na"),
      new Element("Lítio", "Li"),
      new Element("Cálcio", "Ca"),
      new Element("Oxigênio", "O"),
      new Element("Ferro", "Fe"),
      new Element("Alumínio", "Al"),
      new Element("Potássio", "K"),
      new Element("Fósforo", "P"),
    };

    int totalRows = 3;
    int totalElements = elementsList.Length;
    
    int elementsPerRow = totalElements / totalRows;
    for (int i = 0; i < totalElements; i++) {
      GameObject ElementInstance;

      // Get element row and column
      int row = Mathf.FloorToInt(i/elementsPerRow);
      int column = i%elementsPerRow;

      // Get element position
      float positionY = 0.8F + (row * 1.1F);
      float positionX = -2F + (column * 1.1F);      
      
      // Render element
      ElementInstance = Instantiate(ElementPrefab, new Vector3(positionX, positionY, (float)6.5), Quaternion.identity);
      ElementInstance.name = elementsList[i].shortName;

      // Set its color
      Color cubeColor = new Color(0, 0, 0.312F, 1);
      if (i%2 == 0) { cubeColor = new Color(0, 0.255F, 1, 1); };
      ElementInstance.GetComponent<Renderer>().material.color = cubeColor;
      ElementInstance.GetComponent<Renderer>().material.SetColor("_EmissionColor", (cubeColor * Mathf.LinearToGammaSpace(2f)));
      ElementInstance.GetComponent<Renderer>().material.DisableKeyword("_EMISSION");

      // Set small text
      ElementInstance.transform.Find("Canvas/Text(Small)").GetComponent<TextMeshProUGUI>().text = elementsList[i].shortName;

      // Set extended text
      ElementInstance.transform.Find("Canvas/Text(Extended)").GetComponent<TextMeshProUGUI>().text = elementsList[i].name;
    }

  }
}
