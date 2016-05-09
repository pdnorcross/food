class PersonsController < ApplicationController
  require 'csv'

  def index
    @persons = Person.all
  end

  def import
    Person.import(params[:file])
    redirect_to root_url, notice: 'Data Imported'
  end

  def ar
    @persons = Person.where(state: 'AR')
    diabetes_adult = Person.where(state: 'AR').average("pct_diabetes_adult").round
    obese_adult = Person.where(state: 'AR').average("pct_obese_adult").round
    obese_child = Person.where(state: 'AR').average("pct_obese_child").round
    low_av = Person.where(state: 'AR').average("pct_la_stores").round
    la_li = Person.where(state: 'AR').average("pct_la_li").round
    ffr = Person.where(state: 'AR').average("ffr").round
    fmrkt = Person.where(state: 'AR').average("fmrkt").round
    groc = Person.where(state: 'AR').average("groc").round
    superc = Person.where(state: 'AR').average("superc").round

    @fart = Fusioncharts::Chart.new({
                                         width: "400",
                                         height: "400",
                                         type: "mscolumn2d",
                                         renderAt: "fartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Health of People",
                                                 subCaption: "Arkansas",
                                                 xAxisname: "Rate",
                                                 yAxisName: "Percent",
                                                 numberPrefix: "",
                                                 numberSuffix: "%",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "Health"},
                                                                  { label: "Availability"}

                                                              ]
                                                          }],
                                             dataset: [
                                                 {
                                                     seriesname: "Adult Diabetes",
                                                     data: [
                                                         { value: diabetes_adult}

                                                     ]
                                                 },
                                                 {
                                                     seriesname: "Adult Obesity",
                                                     data: [
                                                         { value: obese_adult}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Child Obesity",
                                                     data: [
                                                         { value: obese_child}
                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Low Availability of Stores",
                                                     data: [
                                                         { value: "0"},
                                                         { value: low_av}
                                                     ]
                                                 },


                                                 {
                                                     seriesname: "Low Availability & Low Income",
                                                     data: [
                                                         { value: "0"},
                                                         {value: la_li}
                                                     ]
                                                 }
                                             ]
                                         }
                                     })

    @chart = Fusioncharts::Chart.new({
                                         width: "400",
                                         height: "400",
                                         type: "mscolumn2d",
                                         renderAt: "chartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Food Availability",
                                                 subCaption: "Arkansas",
                                                 xAxisname: "Rate",
                                                 yAxisName: "Percent",
                                                 numberPrefix: "",
                                                 numberSuffix: "",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "Places to Get Food"}

                                                              ]
                                                          }],
                                             dataset: [
                                                 {
                                                     seriesname: "Fast Food",
                                                     data: [
                                                         { value: ffr}

                                                     ]
                                                 },
                                                 {
                                                     seriesname: "Grocery Stores",
                                                     data: [
                                                         { value: groc}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Farmers Market",
                                                     data: [
                                                         { value: fmrkt}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Super Centers",
                                                     data: [
                                                         { value: superc}
                                                     ]
                                                 }
                                             ]
                                         }
                                     })


  end

  def la
    @persons = Person.where(state: 'LA')
    diabetes_adult = Person.where(state: 'LA').average("pct_diabetes_adult").round
    obese_adult = Person.where(state: 'LA').average("pct_obese_adult").round
    obese_child = Person.where(state: 'LA').average("pct_obese_child").round
    low_av = Person.where(state: 'LA').average("pct_la_stores").round
    la_li = Person.where(state: 'LA').average("pct_la_li").round
    ffr = Person.where(state: 'LA').average("ffr").round
    fmrkt = Person.where(state: 'LA').average("fmrkt").round
    groc = Person.where(state: 'LA').average("groc").round
    superc = Person.where(state: 'LA').average("superc").round


    @fart = Fusioncharts::Chart.new({
                                        width: "400",
                                        height: "400",
                                        type: "mscolumn2d",
                                        renderAt: "fartContainer",
                                        dataSource: {
                                            chart: {
                                                caption: "Health of People",
                                                subCaption: "Louisiana",
                                                xAxisname: "Rate",
                                                yAxisName: "Percent",
                                                numberPrefix: "",
                                                numberSuffix: "%",
                                                theme: "fint",
                                                exportEnabled: "1",
                                            },
                                            categories: [{
                                                             category: [
                                                                 { label: "Health"},
                                                                 { label: "Availability"}

                                                             ]
                                                         }],
                                            dataset: [
                                                {
                                                    seriesname: "Adult Diabetes",
                                                    data: [
                                                        { value: diabetes_adult}

                                                    ]
                                                },
                                                {
                                                    seriesname: "Adult Obesity",
                                                    data: [
                                                        { value: obese_adult}

                                                    ]
                                                },

                                                {
                                                    seriesname: "Child Obesity",
                                                    data: [
                                                        { value: obese_child}
                                                    ]
                                                },

                                                {
                                                    seriesname: "Low Availability of Stores",
                                                    data: [
                                                        { value: "0"},
                                                        { value: low_av}
                                                    ]
                                                },


                                                {
                                                    seriesname: "Low Availability & Low Income",
                                                    data: [
                                                        { value: "0"},
                                                        {value: la_li}
                                                    ]
                                                }
                                            ]
                                        }
                                    })

    @chart = Fusioncharts::Chart.new({
                                         width: "400",
                                         height: "400",
                                         type: "mscolumn2d",
                                         renderAt: "chartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Food Availability",
                                                 subCaption: "Louisiana",
                                                 xAxisname: "Rate",
                                                 yAxisName: "Percent",
                                                 numberPrefix: "",
                                                 numberSuffix: "",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "Places to Get Food"}

                                                              ]
                                                          }],
                                             dataset: [
                                                 {
                                                     seriesname: "Fast Food",
                                                     data: [
                                                         { value: ffr}

                                                     ]
                                                 },
                                                 {
                                                     seriesname: "Grocery Stores",
                                                     data: [
                                                         { value: groc}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Farmers Market",
                                                     data: [
                                                         { value: fmrkt}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Super Centers",
                                                     data: [
                                                         { value: superc}
                                                     ]
                                                 }
                                             ]
                                         }
                                     })
  end

  def ma
    @persons = Person.where(state: 'MA')
    diabetes_adult = Person.where(state: 'MA').average("pct_diabetes_adult").round
    obese_adult = Person.where(state: 'MA').average("pct_obese_adult").round
    obese_child = Person.where(state: 'MA').average("pct_obese_child").round
    low_av = Person.where(state: 'MA').average("pct_la_stores").round
    la_li = Person.where(state: 'MA').average("pct_la_li").round
    ffr = Person.where(state: 'MA').average("ffr").round
    fmrkt = Person.where(state: 'MA').average("fmrkt").round
    groc = Person.where(state: 'MA').average("groc").round
    superc = Person.where(state: 'MA').average("superc").round


    @fart = Fusioncharts::Chart.new({
                                        width: "400",
                                        height: "400",
                                        type: "mscolumn2d",
                                        renderAt: "fartContainer",
                                        dataSource: {
                                            chart: {
                                                caption: "Health of People",
                                                subCaption: "Massachusetts",
                                                xAxisname: "Rate",
                                                yAxisName: "Percent",
                                                numberPrefix: "",
                                                numberSuffix: "%",
                                                theme: "fint",
                                                exportEnabled: "1",
                                            },
                                            categories: [{
                                                             category: [
                                                                 { label: "Health"},
                                                                 { label: "Availability"}

                                                             ]
                                                         }],
                                            dataset: [
                                                {
                                                    seriesname: "Adult Diabetes",
                                                    data: [
                                                        { value: diabetes_adult}

                                                    ]
                                                },
                                                {
                                                    seriesname: "Adult Obesity",
                                                    data: [
                                                        { value: obese_adult}

                                                    ]
                                                },

                                                {
                                                    seriesname: "Child Obesity",
                                                    data: [
                                                        { value: obese_child}
                                                    ]
                                                },

                                                {
                                                    seriesname: "Low Availability of Stores",
                                                    data: [
                                                        { value: "0"},
                                                        { value: low_av}
                                                    ]
                                                },


                                                {
                                                    seriesname: "Low Availability & Low Income",
                                                    data: [
                                                        { value: "0"},
                                                        {value: la_li}
                                                    ]
                                                }
                                            ]
                                        }
                                    })

    @chart = Fusioncharts::Chart.new({
                                         width: "400",
                                         height: "400",
                                         type: "mscolumn2d",
                                         renderAt: "chartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Food Availability",
                                                 subCaption: "Massachusetts",
                                                 xAxisname: "Rate",
                                                 yAxisName: "Percent",
                                                 numberPrefix: "",
                                                 numberSuffix: "",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "Places to Get Food"}

                                                              ]
                                                          }],
                                             dataset: [
                                                 {
                                                     seriesname: "Fast Food",
                                                     data: [
                                                         { value: ffr}

                                                     ]
                                                 },
                                                 {
                                                     seriesname: "Grocery Stores",
                                                     data: [
                                                         { value: groc}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Farmers Market",
                                                     data: [
                                                         { value: fmrkt}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Super Centers",
                                                     data: [
                                                         { value: superc}
                                                     ]
                                                 }
                                             ]
                                         }
                                     })
  end

  def vt
    @persons = Person.where(state: 'VT')
    diabetes_adult = Person.where(state: 'VT').average("pct_diabetes_adult").round
    obese_adult = Person.where(state: 'VT').average("pct_obese_adult").round
    obese_child = Person.where(state: 'VT').average("pct_obese_child").round
    low_av = Person.where(state: 'VT').average("pct_la_stores").round
    la_li = Person.where(state: 'VT').average("pct_la_li").round
    ffr = Person.where(state: 'VT').average("ffr").round
    fmrkt = Person.where(state: 'VT').average("fmrkt").round
    groc = Person.where(state: 'VT').average("groc").round
    superc = Person.where(state: 'VT').average("superc").round


    @fart = Fusioncharts::Chart.new({
                                        width: "400",
                                        height: "400",
                                        type: "mscolumn2d",
                                        renderAt: "fartContainer",
                                        dataSource: {
                                            chart: {
                                                caption: "Health of People",
                                                subCaption: "Vermont",
                                                xAxisname: "Rate",
                                                yAxisName: "Percent",
                                                numberPrefix: "",
                                                numberSuffix: "%",
                                                theme: "fint",
                                                exportEnabled: "1",
                                            },
                                            categories: [{
                                                             category: [
                                                                 { label: "Health"},
                                                                 { label: "Availability"}

                                                             ]
                                                         }],
                                            dataset: [
                                                {
                                                    seriesname: "Adult Diabetes",
                                                    data: [
                                                        { value: diabetes_adult}

                                                    ]
                                                },
                                                {
                                                    seriesname: "Adult Obesity",
                                                    data: [
                                                        { value: obese_adult}

                                                    ]
                                                },

                                                {
                                                    seriesname: "Child Obesity",
                                                    data: [
                                                        { value: obese_child}
                                                    ]
                                                },

                                                {
                                                    seriesname: "Low Availability of Stores",
                                                    data: [
                                                        { value: "0"},
                                                        { value: low_av}
                                                    ]
                                                },


                                                {
                                                    seriesname: "Low Availability & Low Income",
                                                    data: [
                                                        { value: "0"},
                                                        {value: la_li}
                                                    ]
                                                }
                                            ]
                                        }
                                    })

    @chart = Fusioncharts::Chart.new({
                                         width: "400",
                                         height: "400",
                                         type: "mscolumn2d",
                                         renderAt: "chartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Food Availability",
                                                 subCaption: "Vermont",
                                                 xAxisname: "Rate",
                                                 yAxisName: "Percent",
                                                 numberPrefix: "",
                                                 numberSuffix: "",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "Places to Get Food"}

                                                              ]
                                                          }],
                                             dataset: [
                                                 {
                                                     seriesname: "Fast Food",
                                                     data: [
                                                         { value: ffr}

                                                     ]
                                                 },
                                                 {
                                                     seriesname: "Grocery Stores",
                                                     data: [
                                                         { value: groc}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Farmers Market",
                                                     data: [
                                                         { value: fmrkt}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Super Centers",
                                                     data: [
                                                         { value: superc}
                                                     ]
                                                 }
                                             ]
                                         }
                                     })
  end



  def large_comp
    @persons = Person.all
    diabetes_adult_ar = Person.where(state: 'AR').average("pct_diabetes_adult").round
    diabetes_adult_la = Person.where(state: 'LA').average("pct_diabetes_adult").round
    diabetes_adult_ma = Person.where(state: 'MA').average("pct_diabetes_adult").round
    diabetes_adult_vt = Person.where(state: 'VT').average("pct_diabetes_adult").round
    obese_adult_ar = Person.where(state: 'AR').average("pct_obese_adult").round
    obese_child_ar = Person.where(state: 'AR').average("pct_obese_child").round
    obese_adult_la = Person.where(state: 'LA').average("pct_obese_adult").round
    obese_child_la = Person.where(state: 'LA').average("pct_obese_child").round
    obese_adult_ma = Person.where(state: 'MA').average("pct_obese_adult").round
    obese_child_ma = Person.where(state: 'MA').average("pct_obese_child").round
    obese_adult_vt = Person.where(state: 'VT').average("pct_obese_adult").round
    obese_child_vt = Person.where(state: 'VT').average("pct_obese_child").round
    low_av_ar = Person.where(state: 'AR').average("pct_la_stores").round
    la_li_ar = Person.where(state: 'AR').average("pct_la_li").round
    ffr_ar = Person.where(state: 'AR').average("ffr").round
    low_av_la = Person.where(state: 'LA').average("pct_la_stores").round
    la_li_la = Person.where(state: 'LA').average("pct_la_li").round
    ffr_la = Person.where(state: 'LA').average("ffr").round
    low_av_ma = Person.where(state: 'MA').average("pct_la_stores").round
    la_li_ma = Person.where(state: 'MA').average("pct_la_li").round
    ffr_ma = Person.where(state: 'MA').average("ffr").round
    low_av_vt = Person.where(state: 'VT').average("pct_la_stores").round
    la_li_vt = Person.where(state: 'VT').average("pct_la_li").round
    ffr_vt = Person.where(state: 'VT').average("ffr").round
    fmrkt_ar = Person.where(state: 'AR').average("fmrkt").round
    groc_ar = Person.where(state: 'AR').average("groc").round
    superc_ar = Person.where(state: 'AR').average("superc").round
    fmrkt_la = Person.where(state: 'LA').average("fmrkt").round
    groc_la = Person.where(state: 'LA').average("groc").round
    superc_la = Person.where(state: 'LA').average("superc").round
    fmrkt_ma = Person.where(state: 'MA').average("fmrkt").round
    groc_ma = Person.where(state: 'MA').average("groc").round
    superc_ma = Person.where(state: 'MA').average("superc").round
    fmrkt_vt = Person.where(state: 'VT').average("fmrkt").round
    groc_vt = Person.where(state: 'VT').average("groc").round
    superc_vt = Person.where(state: 'VT').average("superc").round


    @fart = Fusioncharts::Chart.new({
                                        width: "700",
                                        height: "500",
                                        type: "mscolumn2d",
                                        renderAt: "fartContainer",
                                        dataSource: {
                                            chart: {
                                                caption: "Health of People",
                                                subCaption: "All",
                                                xAxisname: "Rate",
                                                yAxisName: "Percent",
                                                numberPrefix: "",
                                                numberSuffix: "%",
                                                theme: "fint",
                                                exportEnabled: "1",
                                            },
                                            categories: [{
                                                             category: [
                                                                 { label: "Arkansas"},
                                                                 { label: "Louisiana"},
                                                                 { label: "Massachusetts"},
                                                                 { label: "Vermont"}

                                                             ]
                                                         }],
                                            dataset: [
                                                {
                                                    seriesname: "Adult Diabetes",
                                                    data: [
                                                        { value: diabetes_adult_ar},
                                                        { value: diabetes_adult_la},
                                                        { value: diabetes_adult_ma},
                                                        { value: diabetes_adult_vt}

                                                    ]
                                                },
                                                {
                                                    seriesname: "Adult Obesity",
                                                    data: [
                                                        { value: obese_adult_ar},
                                                        { value: obese_adult_la},
                                                        { value: obese_adult_ma},
                                                        { value: obese_adult_vt},

                                                    ]
                                                },

                                                {
                                                    seriesname: "Child Obesity",
                                                    data: [
                                                        { value: obese_child_ar},
                                                        { value: obese_child_la},
                                                        { value: obese_child_ma},
                                                        { value: obese_child_vt}
                                                    ]
                                                },

                                                {
                                                    seriesname: "Low Availability of Stores",
                                                    data: [
                                                        { value: low_av_ar},
                                                        { value: low_av_la},
                                                        { value: low_av_ma},
                                                        { value: low_av_vt}
                                                    ]
                                                },


                                                {
                                                    seriesname: "Low Availability & Low Income",
                                                    data: [
                                                        {value: la_li_ar},
                                                        {value: la_li_la},
                                                        {value: la_li_ma},
                                                        {value: la_li_vt}
                                                    ]
                                                }
                                            ]
                                        }
                                    })

    @chart = Fusioncharts::Chart.new({
                                         width: "700",
                                         height: "500",
                                         type: "mscolumn2d",
                                         renderAt: "chartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Food Availability",
                                                 subCaption: "All",
                                                 xAxisname: "Rate",
                                                 yAxisName: "Percent",
                                                 numberPrefix: "",
                                                 numberSuffix: "",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "Arkansas"},
                                                                  { label: "Louisiana"},
                                                                  { label: "Massachusetts"},
                                                                  { label: "Vermont"}

                                                              ]
                                                          }],
                                             dataset: [



                                                 {
                                                     seriesname: "Farmers Market",
                                                     data: [
                                                         { value: fmrkt_ar},
                                                         { value: fmrkt_la},
                                                         { value: fmrkt_ma},
                                                         { value: fmrkt_vt}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Super Centers",
                                                     data: [
                                                         { value: superc_ar},
                                                         { value: superc_la},
                                                         { value: superc_ma},
                                                         { value: superc_vt}
                                                     ]
                                                 }
                                             ]
                                         }
                                     })


  end


  def ffr
    @persons = Person.all

    @bart = Fusioncharts::Chart.new({
                                        width: "700",
                                        height: "500",
                                        type: "msbar2d",
                                        renderAt: "chartContainer",
                                        dataSource: {
                                            chart: {
                                                caption: "Fast Food Restraunts",
                                                subCaption: "All",
                                                xAxisname: "State",
                                                yAxisName: "Avg Number of People/Establishment",
                                                numberPrefix: "",
                                                numberSuffix: "",
                                                theme: "fint",
                                                exportEnabled: "1",
                                            },
                                            categories: [{
                                                             category: [
                                                                 { label: "State"}

                                                             ]
                                                         }],
                                            dataset: [
                                                {
                                                    seriesname: "Arkansas",
                                                    data: [
                                                        { value: 1361}

                                                    ]
                                                },
                                                {
                                                    seriesname: "Louisiana",
                                                    data: [
                                                        { value: 1548}

                                                    ]
                                                },

                                                {
                                                    seriesname: "Massachusetts",
                                                    data: [
                                                        { value: 1458}

                                                    ]
                                                },

                                                {
                                                    seriesname: "Vermont",
                                                    data: [
                                                        { value: 1599}
                                                    ]
                                                }
                                            ]
                                        }
                                    })

  end

  def groc
    @persons = Person.all
    groc_ar = Person.where(state: 'AR').average("groc").round
    groc_la = Person.where(state: 'LA').average("groc").round
    groc_ma = Person.where(state: 'MA').average("groc").round
    groc_vt = Person.where(state: 'VT').average("groc").round

    @heart = Fusioncharts::Chart.new({
                                         width: "700",
                                         height: "500",
                                         type: "msbar2d",
                                         renderAt: "chartContainer",
                                         dataSource: {
                                             chart: {
                                                 caption: "Fast Food Restraunts",
                                                 subCaption: "All",
                                                 xAxisname: "State",
                                                 yAxisName: "Grocery Store Availability/county(AVG)",
                                                 numberPrefix: "",
                                                 numberSuffix: "",
                                                 theme: "fint",
                                                 exportEnabled: "1",
                                             },
                                             categories: [{
                                                              category: [
                                                                  { label: "State"}

                                                              ]
                                                          }],
                                             dataset: [
                                                 {
                                                     seriesname: "Arkansas",
                                                     data: [
                                                         { value: groc_ar}

                                                     ]
                                                 },
                                                 {
                                                     seriesname: "Louisiana",
                                                     data: [
                                                         { value: groc_la}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Massachusetts",
                                                     data: [
                                                         { value: groc_ma}

                                                     ]
                                                 },

                                                 {
                                                     seriesname: "Vermont",
                                                     data: [
                                                         { value: groc_vt}
                                                     ]
                                                 }
                                             ]
                                         }
                                     })
  end
private

  def person_params
    params.require(:person).permit!
  end

end