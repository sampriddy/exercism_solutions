defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds)
  def age_on(:earth, seconds), do: earth_age(seconds)
  def age_on(:mercury, seconds), do: earth_age(seconds) / 0.2408467
  def age_on(:venus, seconds), do: earth_age(seconds) / 0.61519726
  def age_on(:mars, seconds), do: earth_age(seconds) / 1.8808158
  def age_on(:jupiter, seconds), do: earth_age(seconds) / 11.862615
  def age_on(:saturn, seconds), do: earth_age(seconds) / 29.447498
  def age_on(:uranus, seconds), do: earth_age(seconds) / 84.016846
  def age_on(:neptune, seconds), do: earth_age(seconds) / 164.79132

  defp earth_age(seconds), do: seconds / 31557600
end
