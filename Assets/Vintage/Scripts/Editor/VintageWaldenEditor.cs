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
  /// Vintage Walden Editor.
  /// </summary>
  [CustomEditor(typeof(VintageWalden))]
  public class VintageWaldenEditor : ImageEffectBaseEditor
  {
    /// <summary>
    /// Inspector.
    /// </summary>
    protected override void Inspector()
    {
      VintageWalden thisTarget = (VintageWalden)target;

      thisTarget.obturation = VintageEditorHelper.IntSliderWithReset("Obturation", VintageEditorHelper.TooltipObturation, (int)(thisTarget.obturation * 50.0f), 0, 100, 50) * 0.02f;
    }
  }
}