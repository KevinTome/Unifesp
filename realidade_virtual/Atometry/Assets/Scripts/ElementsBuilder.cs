using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ElementsBuilder : MonoBehaviour
{
  public GameObject ElementPrefab;
  public GameObject ElementsGroup;
  public void Render() {
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
      new Element("Chumbo", "Pb"),
      new Element("Flúor", "F"),
      new Element("Cobre", "Cu"),
    };

    int totalRows = 4;
    int totalElements = elementsList.Length;
    
    int elementsPerRow = totalElements / totalRows;

    ElementsGroup = new GameObject("ElementsGroup");
    for (int i = 0; i < totalElements; i++) {
      GameObject ElementInstance;

      // Get element row and column
      int row = Mathf.FloorToInt(i/elementsPerRow);
      int column = i%elementsPerRow;

      // Get element position
      float positionY = 0.8F + (row * 0.9F);
      float positionX = -4F + (column * 0.9F);
      
      // Render element
      ElementInstance = Instantiate(ElementPrefab, new Vector3(positionX, positionY, (float)-4.75F), Quaternion.identity);
      ElementInstance.transform.parent = ElementsGroup.transform;
      ElementInstance.name = elementsList[i].shortName;

      // Set its color
      Color cubeColor = new Color(0, 0.3F, 0, 1);
      ElementInstance.GetComponent<Renderer>().material.color = cubeColor;
      ElementInstance.GetComponent<Renderer>().material.SetColor("_EmissionColor",(cubeColor * Mathf.LinearToGammaSpace(2f)));
      ElementInstance.GetComponent<Renderer>().material.DisableKeyword("_EMISSION");

      // Set small text
      ElementInstance.transform.Find("Canvas/Text(Small)").GetComponent<TextMeshProUGUI>().text = elementsList[i].shortName;

      // Set extended text
      ElementInstance.transform.Find("Canvas/Text(Extended)").GetComponent<TextMeshProUGUI>().text = elementsList[i].name;
    }
  }
}
