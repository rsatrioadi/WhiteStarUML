
/*
 Copyright (C) 2003 RiskMap srl

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it under the
 terms of the QuantLib license.  You should have received a copy of the
 license along with this program; if not, please email quantlib-dev@lists.sf.net
 The license is also available online at http://quantlib.org/html/license.html

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

/*! \file jointcalendar.cpp
    \brief Joint calendar
*/

#include <ql/Calendars/jointcalendar.hpp>

namespace QuantLib {

    namespace Calendars {

        JointCalendar::Impl::Impl(const Calendar& c1, 
                                  const Calendar& c2, 
                                  JointCalendarRule r) 
        : rule_(r), calendars_(2) {
            calendars_[0] = c1;
            calendars_[1] = c2;
        }

        JointCalendar::Impl::Impl(const Calendar& c1, 
                                  const Calendar& c2, 
                                  const Calendar& c3, 
                                  JointCalendarRule r) 
        : rule_(r), calendars_(3) {
            calendars_[0] = c1;
            calendars_[1] = c2;
            calendars_[2] = c3;
        }

        JointCalendar::Impl::Impl(const Calendar& c1, 
                                  const Calendar& c2, 
                                  const Calendar& c3, 
                                  const Calendar& c4, 
                                  JointCalendarRule r) 
        : rule_(r), calendars_(4) {
            calendars_[0] = c1;
            calendars_[1] = c2;
            calendars_[2] = c3;
            calendars_[3] = c4;
        }

        std::string JointCalendar::Impl::name() const {
            std::string fullName = calendars_.front().name();
            std::vector<Calendar>::const_iterator i;
            for (i=calendars_.begin()+1; i!=calendars_.end(); ++i)
                fullName += " + " + i->name();
            return fullName;
        }

        bool JointCalendar::Impl::isBusinessDay(const Date& date) const {
            std::vector<Calendar>::const_iterator i;
            switch (rule_) {
              case JoinHolidays:
                for (i=calendars_.begin(); i!=calendars_.end(); ++i) {
                    if (i->isHoliday(date))
                        return false;
                }
                return true;
              case JoinBusinessDays:
                for (i=calendars_.begin(); i!=calendars_.end(); ++i) {
                    if (i->isBusinessDay(date))
                        return true;
                }
                return false;
              default:
                throw Error("unknown joint calendar rule");
            }
        }

        
        JointCalendar::JointCalendar(const Calendar& c1,
                                     const Calendar& c2,
                                     JointCalendarRule r)
        : Calendar(Handle<Calendar::Impl>(
                       new JointCalendar::Impl(c1,c2,r))) {}
            
        JointCalendar::JointCalendar(const Calendar& c1,
                                     const Calendar& c2,
                                     const Calendar& c3,
                                     JointCalendarRule r)
        : Calendar(Handle<Calendar::Impl>(
                       new JointCalendar::Impl(c1,c2,c3,r))) {}
            
        JointCalendar::JointCalendar(const Calendar& c1,
                                     const Calendar& c2,
                                     const Calendar& c3,
                                     const Calendar& c4,
                                     JointCalendarRule r)
        : Calendar(Handle<Calendar::Impl>(
                       new JointCalendar::Impl(c1,c2,c3,c4,r))) {}
        
    }

}

