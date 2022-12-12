using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

class Element {
    public string name;
    public string shortName;
    public Element(string name, string shortName) {
        this.name = name;
        this.shortName = shortName;
    }
};

public class ElementsRenderer : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Element[] elements = {
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
        int totalElements = elements.Length;
        int totalRows = 3;

        int elementsPerRow = totalElements / totalRows;
        for (int i = 0; i < totalElements; i++) {
            // Get element row and column
            int row = Mathf.FloorToInt(i/elementsPerRow);
            int column = i%elementsPerRow;

            // Get element position
            float positionY = 0.8F + (row * 1.1F);
            float positionX = -2F + (column * 1.1F);

            // Render cube
            GameObject cubeObj = GameObject.CreatePrimitive(PrimitiveType.Cube);
            cubeObj.transform.localScale = new Vector3(1, 1, (float)0.2);
            cubeObj.transform.position = new Vector3(positionX, positionY, (float)4.5);

            Color cubeColor = new Color(0, 0, 0.312F, 1);
            if (i%2 == 0) { cubeColor = new Color(0, 0.255F, 1, 1); };
            cubeObj.GetComponent<Renderer>().material.color = cubeColor;

            // Render text
            int LayerUI = LayerMask.NameToLayer("UI");

            GameObject canvasObj = new GameObject("Canvas");
            canvasObj.transform.parent = cubeObj.transform;
            canvasObj.layer = LayerUI;
            canvasObj.AddComponent<RectTransform> ();
            RectTransform canvasTransform = canvasObj.GetComponent<RectTransform>();
            canvasTransform.localPosition = new Vector3(0, 0, -0.5F);
            canvasTransform.rotation = new Quaternion(0, 0, 0, 0);
            canvasTransform.localScale = new Vector3(1, 1, 5);
            canvasTransform.anchorMax = new Vector2(0, 0);
            canvasTransform.anchorMin = new Vector2(0, 0);
            canvasTransform.sizeDelta = new Vector2(1, 1);
            canvasObj.AddComponent<Canvas> ();
            canvasObj.AddComponent<GraphicRaycaster> ();

            GameObject textObj = new GameObject("Text(Small)");
            textObj.layer = LayerUI;
            textObj.transform.parent = canvasObj.transform;
            textObj.AddComponent<RectTransform> ();
            RectTransform textTransform = textObj.GetComponent<RectTransform>();
            textTransform.localPosition =  new Vector3(0, 0.1F, -0.1F);
            textTransform.localScale = new Vector3(0.01F, 0.01F, 0.01F);
            
            textObj.AddComponent<CanvasRenderer> ();
            textObj.AddComponent<TextMeshProUGUI> ();
            TextMeshProUGUI tm = textObj.GetComponent<TextMeshProUGUI>();
            tm.text = elements[i].shortName;
            tm.color = new Color(255, 255, 255);
            tm.fontWeight = FontWeight.Bold;
            tm.fontSize = 50F;
            tm.alignment = TextAlignmentOptions.Center;
            textTransform.sizeDelta = new Vector2(100, 100);

            GameObject textObj2 = new GameObject("Text(Extended)");
            textObj2.layer = LayerUI;
            textObj2.transform.parent = canvasObj.transform;
            textObj2.AddComponent<RectTransform> ();
            RectTransform textTransform2 = textObj2.GetComponent<RectTransform>();
            textTransform2.localPosition =  new Vector3(0, 0.1F, -0.1F);
            textTransform2.localScale = new Vector3(0.01F, 0.01F, 0.01F);
            
            textObj2.AddComponent<CanvasRenderer> ();
            textObj2.AddComponent<TextMeshProUGUI> ();
            TextMeshProUGUI tm2 = textObj2.GetComponent<TextMeshProUGUI>();
            tm2.text = elements[i].name;
            tm2.color = new Color(255, 255, 255);
            tm2.fontWeight = FontWeight.Bold;
            tm2.fontSize = 14F;
            tm2.alignment = TextAlignmentOptions.Bottom;
            textTransform2.sizeDelta = new Vector2(100, 100);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
