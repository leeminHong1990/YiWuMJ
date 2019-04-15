# -*- coding: utf-8 -*-

import const
import x42


class iDAUOperation(object):

	def queryTodayDAU(self, club_id):
		if x42.ClubStub.isClubMember(club_id, self.userId):
			club = x42.ClubStub.clubs[club_id]
			self.queryDAUResult(club_id, club.get_today_dau(), const.DAU_TODAY)
		else:
			self.queryDAUFailed(-1)

	def queryYesterdayDAU(self, club_id):
		if x42.ClubStub.isClubMember(club_id, self.userId):
			club = x42.ClubStub.clubs[club_id]
			self.queryDAUResult(club_id, club.get_yesterday_dau(), const.DAU_YESTERDAY)
		else:
			self.queryDAUFailed(-1)

	def queryDAUResult(self, club_id, data, query_type):
		if getattr(self, 'client', None):
			self.client.queryDAUResult(club_id, data, query_type)

	def queryDAUFailed(self, code):
		if getattr(self, 'client', None):
			self.client.queryDAUFailed(code)
