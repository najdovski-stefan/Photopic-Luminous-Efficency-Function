# Photopic Luminous Efficiency Function

An aproximation of the CIE empirical data on how is visible light percived by humans, written in Fortran

<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <mi>V</mi>
  <mo stretchy="false">(</mo>
  <mi>λ<!-- λ --></mi>
  <mo stretchy="false">)</mo>
  <mo>=</mo>
  <mn>1.019</mn>
  <msup>
    <mi>e</mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mo>−<!-- − --></mo>
      <mn>285.4</mn>
      <mo stretchy="false">(</mo>
      <mi>λ<!-- λ --></mi>
      <mo>−<!-- − --></mo>
      <mn>0.559</mn>
      <msup>
        <mo stretchy="false">)</mo>
        <mn>2</mn>
      </msup>
    </mrow>
  </msup>
</math>

## Requiments:

- gfortran
- gnuplot

## How to execute

```bash
chmod +x build_run.sh
./build_run.sh
```


<img src="v_lambda_plot.png">


## Reference
- [CIE](https://cie.co.at/datatable/cie-spectral-luminous-efficiency-photopic-vision)
