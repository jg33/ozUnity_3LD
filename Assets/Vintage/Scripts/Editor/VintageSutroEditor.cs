///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Vintage - Image Effects.
//
// Copyright (c) Ibuprogames <hello@ibuprogames.com>. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
using UnityEditor;

namespace VintageImageEffects
{
  /// <summary>
  /// Vintage Sutro Editor.
  /// </summary>
  [CustomEditor(typeof(VintageSutro))]
  public class VintageSutroEditor : ImageEffectBaseEditor
  {
    /// <summary>
    /// Inspector.
    /// </summary>
    protected override void Inspector()
    {
      VintageSutro thisTarget = (VintageSutro)target;

      thisTarget.Obturation = VintageEditorHelper.SliderWithReset("Obturation", "Obturation of the vignette.\nFrom 0 (no obturation) to 2 (semi closed).", thisTarget.Obturation, 0.0f, 2.0f, 1.0f);
    }
  }
}